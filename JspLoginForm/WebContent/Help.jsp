<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<!-- 회원인지 확인 -->
	<jsp:include page="/common/CheckMember.jsp"></jsp:include>
	


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 부트스트랩 css -->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/memberlist.css">


</head>
<body>

	<div id="fullwrap">

		<div id="header"><jsp:include page="/common/Top.jsp"></jsp:include></div>
		<div id="contentarea">

			<div id="leftarea"><jsp:include page="/common/Left.jsp"></jsp:include></div>
			<div id="chaingingarea">


				<div class="container py-5">
					<div class="row">
						<div class="col-lg-7 mx-auto bg-white rounded shadow">
							
														<!-- Fixed header table-->
							<div class="table-responsive">

								<!--  
				회원 목록(리스트) 출력
				목록 (select id, ip from koreamember)
			-->
								<%
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					try{
						conn = Singleton_Helper.getConnection("oracle");
						String sql="select title, name from koreamemberboard";
						pstmt = conn.prepareStatement(sql);
						rs = pstmt.executeQuery(); 
				%>
				
                <!-- Fixed header table-->
                <div class="table-responsive">
                    <table class="table table-fixed">
									<thead>
										<tr>
											<td colspan="5">고객센터</td>
										</tr>
										<tr>
											<th scope="col" class="col-3">#</th>
											<th scope="col" class="col-3">제목</th>
											<th scope="col" class="col-3">작성자</th>
											<th scope="col" class="col-3">변경</th>


										</tr>
									</thead>
									<tbody>
										<% int i = 1;
										while(rs.next()){
											i++; %>
										<tr>
											<th scope="row" class="col-3"><% System.out.print(i);%></th>
											<td class="col-3"><a
												href="boardtext.jsp?title=<%=rs.getString("title")%>"><%=rs.getString("title")%></a></td>
												<td class="col-3">
												<%=rs.getString("name")%></td>	
											<td class="col-3"><a
												href="boardDelete.jsp?title=<%=rs.getString("title")%>">삭제</a>
												<!--  boardEdit 부분 수정중
												<a
												href="boardEdit.jsp?title=<%=rs.getString("title")%>">수정</a>--></td>
										</tr>
										<% } %>
									</tbody>
								</table>

								<hr>
								<form action="boardSearch.jsp" method="post">
									제목: <input type="text" name="search"> <br>
									<input type="submit" value="게시글 검색하기" class="btn btn-primary btn-block" style="width:300px; margin:20px auto;">
									
								</form>
								<form action="boardwrite.jsp" method="post">
								<input type="submit" value="새 글 쓰기" class="btn btn-primary btn-block" style="width:300px; margin:20px auto;">
								</form>
								<hr>
								<%	
					}catch(Exception e){
						
					}finally{
						Singleton_Helper.close(rs);
						Singleton_Helper.close(pstmt);
					}
				%>
							</div>
							<!-- End -->

						</div>
							
						</div>
				</div>
			</div>
			</div>
			<!-- cnotentarea end -->
		</div>

<jsp:include page="/common/Bottom.jsp"></jsp:include>

		<!-- fullwrap end -->
	</div>


</body>
</html>