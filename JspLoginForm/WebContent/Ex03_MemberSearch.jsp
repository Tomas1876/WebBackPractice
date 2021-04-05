<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- 권한검사 -->
	<jsp:include page='/common/Check.jsp'></jsp:include>
	
  	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원조회</title>

</head>
<body>

<div id="fullwrap">
	
		<div id="header"><jsp:include page="/common/Top.jsp"></jsp:include></div>
		<div id="contentarea">
		
			<div id="leftarea"><jsp:include page="/common/Left.jsp"></jsp:include></div>
			<div id="chaingingarea">

 <!--  데이터 받아서 UI 구성 -->
			  <%
			  

			  
			 	String name=request.getParameter("search");	
			 
			 	Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
			    
				//where ename like '%길동%'
				conn = Singleton_Helper.getConnection("oracle");
				String sql="select count(*) from koreamember where name like ?"; // 원래는 아래보다 이게 권장사항
				String sql2 ="select id, name, email from koreamember where name like '%"+name+"%'";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, '%'+name+'%');
				rs= pstmt.executeQuery();
				int rowcount=0;
				if(rs.next()){
					rowcount = rs.getInt(1); //조회건수
				}
			 %>
				<table style="width: 400px;height: 100px;margin-left: auto;margin-right: auto">
							<tr><th colspan="4">회원리스트</th></tr>
							<%
							if(rowcount > 0){
								pstmt = conn.prepareStatement(sql2); 
								rs = pstmt.executeQuery();
								while(rs.next()){
									String id = rs.getString(1);
									String mname = rs.getString(2);
									String email = rs.getString(3);
						%>
								 <tr>
								 	<td><%=id%></td>
								 	<td><%=mname%></td>
								 	<td><%=email %></td>
								 </tr>
						<%			
								} //end while
								out.print("<tr><td colspan='3'>");
								out.print("<b>[" + name + "] 조회결과" + rowcount + "건 조회</b>");
								out.print("</td></tr>");	
							}else{ //조회된 건수가 없는 경우
								out.print("<tr><td colspan='3'>");
								out.print("<b>[" + name + "] 조회결과가 없습니다</b>");
								out.print("</td></tr>");	
							}
						%>
				</table>
				<input type="button" onclick='location.href="Ex03_Memberlist.jsp"' value="목록으로" class="btn btn-primary btn-block"
				style="width:400px; margin:20px auto;"></input>
			<%
				Singleton_Helper.close(rs);
				Singleton_Helper.close(pstmt);
			%>		
				
			</div>
	
		<!-- cnotentarea end -->	
		</div>
	
		<div id="bottomarea"><jsp:include page="/common/Bottom.jsp"></jsp:include></div>
		
	<!-- fullwrap end -->
	</div>

</body>
</html>