<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%    
	if(session.getAttribute("userid") == null || !session.getAttribute("userid").equals("admin") ){
		//강제로 페이지 이동
		
		out.print("<script>alert('권한이 없습니다');</script>");
		//response.sendRedirect("Ex02_JDBC_Login.jsp");
		out.print("<script>location.href='Ex02_JDBC_Login.jsp'</script>");
	}
%>	