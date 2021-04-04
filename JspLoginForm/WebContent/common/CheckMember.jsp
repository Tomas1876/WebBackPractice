<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%    
	if(session.getAttribute("userid") == null){
		//강제로 페이지 이동
		out.print("<script>alert('회원만 사용할 수 있는 페이지입니다');</script>");
		//response.sendRedirect("Ex02_JDBC_Login.jsp");
		out.print("<script>location.href='Ex02_JDBC_Login.jsp'</script>");
	}
%>	