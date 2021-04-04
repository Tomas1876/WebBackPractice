<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

<div id="fullwrap">
	
		<div id="header"><jsp:include page="/common/Top.jsp"></jsp:include></div>
		<div id="contentarea">
		
			<div id="leftarea"><jsp:include page="/common/Left.jsp"></jsp:include></div>
			<div id="chaingingarea">
			<!--  
				게시글 출력
				<table style="width: 400px;height: 100px;margin-left: auto;margin-right: auto">
				</table>
				-->
				<%
				  		String title = request.getParameter("title");
				  
				  		Connection conn = null;
				  		PreparedStatement pstmt = null;
				  		ResultSet rs = null;
				  		
				  		try{
				  			conn = Singleton_Helper.getConnection("oracle");
				  			String sql = "select title,pwd,name,emil,text from koreamemberboard where title=?";
				  			pstmt = conn.prepareStatement(sql);
				  			
				  			pstmt.setString(1, title);
				  			
				  			rs = pstmt.executeQuery();
				  			//rs.next();// 추후에 데이터 1건 경우  (while 없이 )
				  			while(rs.next()){
				  %>
				  			 <table style="width: 400px;height: 100px;margin-left: auto;margin-right: auto;">
				  			 	<tr>
				  			 		<td style="width:100px">제목</td>
				  			 		<td style="width:100px"><%= rs.getString("title") %></td>
				  			 	</tr>
				  			 	<tr>
				  			 		<td style="width:100px">비번</td>
				  			 		<td style="width:100px"><%= rs.getString("pwd") %></td>
				  			 	</tr>
				  			 	<tr>
				  			 		<td style="width:100px">작성자</td>
				  			 		<td style="width:100px"><%= rs.getString("name") %></td>
				  			 	</tr>
				  			 	<tr>
				  			 		<td style="width:100px">이메일</td>
				  			 		<td style="width:100px"><%= rs.getString("email") %></td>
				  			 	</tr>
				  			 	<tr>
				  			 		<td style="width:100px">본문</td>
				  			 		<td style="width:100px"><%= rs.getString("text") %></td>
				  			 	</tr>
				  			 	<tr>
				  			 		<td colspan="2">
				  			 			<a href="Help.jsp">목록보기</a>
				  			 		</td>
				  			 	</tr>
				  			 </table>	
				  <%				
				  			}
				 
				  		}catch(Exception e){
				  			
				  		}finally{
				  			Singleton_Helper.close(rs);
				  			Singleton_Helper.close(pstmt);
				  		}
				  
				  %>
				
			</div>
	
		<!-- cnotentarea end -->	
		</div>
	
	<!-- fullwrap end -->
	</div>

</body>
</html>