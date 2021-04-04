<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 권한검사 -->
<jsp:include page='/common/CheckMember.jsp'></jsp:include>

<%
	
	String title = request.getParameter("title");
	//Help.jsp에서 <a href="boardDelete.jsp?title= 로 보낸 파라미터를 받는다

	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try {
		conn = Singleton_Helper.getConnection("oracle");
		String sql = "delete from koreamemberboard where title=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, title);
		
		int row = pstmt.executeUpdate();
		
		if(row > 0){ // 삭제에 성공했을 경우
			out.print("<script>");
			out.print("alert('삭제되었습니다');");
			out.print("location.href='Help.jsp'");
			out.print("</script>");

		}

	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		Singleton_Helper.close(pstmt);
	}






%>