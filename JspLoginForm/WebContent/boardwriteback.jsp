<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  
	/*  
	게시글 생성 (디자인 필요 없다)
	1.한글처리
	2.데이터 받기(request)
	3.데이터 확인하기
	4.로직처리 (비지니스 로직)
	  회원가입 -> 데이터 받아서 -> DB 연결 -> Insert -> 유무 -> Client 
	 
	 Insert 성공 > 회원가입 > 페이지 이동 > 로그인 화면(로그인 요구) 
	  이동 : java: response.sendRedirect("") , javaScript: location.href="" 
	 >> 클라이언트가 서버에게 페이지를 재요청 
	 >> 
	  
	 
	*/
	request.setCharacterEncoding("UTF-8");
	
	String title = request.getParameter("title"); 
	String pwd = request.getParameter("pwd"); 
	String name = request.getParameter("name"); 
	String email = request.getParameter("email");
	String text = request.getParameter("text");
	
	
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = null;
	PreparedStatement pstmt=null;
	
	try{
		
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","bituser","1004");
		String sql="insert into koreaMemberboard(title,pwd,name,email,text) values(?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, title);
		pstmt.setString(2, pwd);
		pstmt.setString(3, name);
		pstmt.setString(4, email);
		pstmt.setString(5, text);
		
		int result = pstmt.executeUpdate();
		if(result !=0){
			out.print("<script>");
			out.print("alert('작성되었습니다');");
				out.print("location.href='Help.jsp'");	
			out.print("</script>");
		}else{ //실행될 확률 거의없다 ...
			out.print("<script>");
				out.print("alert('작성 실패');");	// 사실 가입실패 예외는 if문 타기 전에 발생한다
			out.print("</script>");				// 그러므로 여기가 아니라 catch블럭에 예외처리를 해야 한다
		}
		
	}catch(Exception e){
		// pstmt.executeUpdate(); 실행시  PK 위반 예외 발생    if 타지 않고 ....
		out.print("<script>");
			out.print("alert('작성실패');");	
			out.print("location.href='boardwrite.jsp'");	
		out.print("</script>");
	}finally{
		if(pstmt != null){ try{pstmt.close();}catch(Exception e){} }
		if(conn != null){ try{conn.close();}catch(Exception e){} }
	}
	
%>










