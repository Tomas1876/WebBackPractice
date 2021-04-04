<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<!-- 권한검사 -->
	<jsp:include page='/common/Check.jsp'></jsp:include>
<%
/*  
 1.관리자만 접근 가능한 페이지
 2.로그인한 일반 회원이 주소값을 외워서 ... 접근불가 
 3.그러면  회원에 관련되 모든 페이지 상단에는 아래 코드를 ..... : sessionCheck.jsp >> include 

if (session.getAttribute("userid") == null || !session.getAttribute("userid").equals("admin")) {
	//강제로 페이지 이동
	//out.print("<script>location.href='Ex02_JDBC_Login.jsp'</script>");
	response.sendRedirect("Ex02_JDBC_Login.jsp");
}
*/
%>

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
								try {
									conn = Singleton_Helper.getConnection("oracle");
									String sql = "select id, name, ip from koreamember";
									pstmt = conn.prepareStatement(sql);
									rs = pstmt.executeQuery();
								%>

								<!-- Fixed header table-->
								<div class="table-responsive">
									<table class="table table-fixed">
										<thead>
											<tr>
												<td colspan="5">회원리스트</td>
											</tr>
											<tr>
												<th scope="col" class="col-3">#</th>
												<th scope="col" class="col-3">id / 이름</th>
												<th scope="col" class="col-3">아이피</th>
												<th scope="col" class="col-3">변경</th>


											</tr>
										</thead>
										<tbody>
											<%
											while (rs.next()) {
												int i = 1;
												i++;
											%>
											<tr>
												<th scope="row" class="col-3">
													<%
													System.out.print(i);
													%>
												</th>
												<td class="col-3"><a
													href='Ex03_MemberDetail.jsp?id=<%=rs.getString("id")%>'><%=rs.getString("id")%>/</a>
													<a
													href='Ex03_MemberDetail.jsp?name=<%=rs.getString("name")%>'><%=rs.getString("name")%></a></td>

												<td class="col-3"><%=rs.getString("ip")%></td>
												<td class="col-3"><a
													href="Ex03_MemberDelete.jsp?id=<%=rs.getString("id")%>">삭제/</a><a
													href="Ex03_MemberEdit.jsp?id=<%=rs.getString("id")%>">수정</a></td>
											</tr>
											<%
											}
											%>
										</tbody>
									</table>

									<hr>
									<form action="Ex03_MemberSearch.jsp" method="post">
										회원명: <input type="text" name="search"> <br> <input
											type="submit" value="이름검색하기" id="btn">
									</form>
									<hr>
									<%
									} catch (Exception e) {

									} finally {
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

						<!-- cnotentarea end -->
					</div>

				</div>

				<!-- fullwrap end -->
			</div>
</body>
</html>