<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 템플릿 링크들 -->

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
	<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v4.7.0/css/all.css">


<!-- 본문 구조 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/join.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


	<!-- 권한검사 -->
	<jsp:include page='/common/CheckMember.jsp'></jsp:include>


<%
/* 
	게시글 수정하기
	1.DB 쿼리 : 2개 (수정정보 : select , 수정정보반영 : update)
	 1.1 : select * from koreamemberboard where title=?
	 1.2 : update koreamember set text=? where title=?		 
	2.화면 1개(기존에 입력내용 보여주는 것)-> 처리 1개 (수정처리)
	 2.1  DB select 한 결과 화면 출력 
	   <input type="text" value="rs.getString(title)">
	      수정(x) 화면출력(O) 전송(x) : <td>rs.getString("title")</td> - 텍스트
	      수정(x) 화면출력(O) 전송(O)   : <input type="text" value="rs.getString(title)" name="title" readonly>
	      수정(O) ..화면출력(O) 전송(O)   :  <input type="text" value="rs.getString(title)" name="title">
	      
	      >> 서버에 전송하려면 name 속성이 있어야 한다
	      	 화면에 출력할 때 가장 중요한 것은 수정가능 여부와 서버 전송여부다 이걸 케이스별로 판단해야 한다
	      	 보통 알아보기 쉽게 수정할 수 있는 것은 색을 다르게 하거나, placeholder를 걸면 된다
*/


%>


</head>
<body>

	<div id="fullwrap">

		<div id="header"><jsp:include page="/common/Top.jsp"></jsp:include></div>
		<div id="contentarea">

			<div id="leftarea"><jsp:include page="/common/Left.jsp"></jsp:include></div>
			<div id="chaingingarea">

				<div class="container">

					
					<%
					
					
					Connection conn = null;
					PreparedStatement rstmt = null;
					ResultSet rs = null;
					
					
					
					
					
					
					%>			

					<div class="card">
						<article class="card-body mx-auto" style="max-width: 400px;">
							<h4 class="card-title mt-3 text-center">게시글 작성</h4>

							<form action="boardwriteback.jsp" method="post" name="boardwrite"
								id="boardwrite">
								
								<!-- form-group// -->
								<div class="form-group input-group">
									<div class="input-group-prepend">
										<span class="input-group-text"> <i class="fa fa-header"></i></span>
									</div>
									<!-- 제목 -->
									<input name="title" class="form-control" placeholder="제목"
										type="text">
								</div>

								<div class="form-group input-group">
									<div class="input-group-prepend">
										<span class="input-group-text"> <i class="fa fa-user"></i>
										</span>
									</div>
									<!-- 이름 -->
									<input class="form-control" placeholder="이름" type="text"
										name="name" id="name">
								</div>

								<div class="form-group input-group">
									<div class="input-group-prepend">
										<span class="input-group-text"> <i class="fa fa-lock"></i>
										</span>
									</div>
									<!-- 비밀번호 -->
									<input class="form-control" placeholder="비밀번호" type="password"
										name="pwd" id="pwd">
								</div>


								<!-- form-group// -->
								<div class="form-group input-group">
									<div class="input-group-prepend">
										<span class="input-group-text"> <i class="fa fa-envelope"></i></span>
									</div>
									<!-- 이메일 -->
									<input name="email" class="form-control" placeholder="Email address"
										type="email">
								</div>
								
								<!-- form-group// -->
								<div class="form-group input-group">
									<div class="input-group-prepend">
										<span class="input-group-text"> <i class="fa fa-keyboard-o"></i></span>
									</div>
									<!-- 본문 -->
									
									<textarea rows="5" cols="20" class="form-control" placeholder="내용"
									id="text" name="text"></textarea>
									<!--  
									<input name="text" class="form-control" placeholder="내용"
										type="text" id="textbox" style="height:200px;cols:20;">-->
								</div>
								
								
								
								<!-- form-group// -->
								<div class="form-group">
									<input type="submit" value="등록"
										class="btn btn-primary btn-block"/> <input
										type="reset" value="취소" class="btn btn-primary btn-block"></input>
										<!-- onclick 링크를 걸면 글 작성이 안된다 
										<input
										type="button" onclick='location.href="Help.jsp"' value="목록으로" class="btn btn-primary btn-block"></input>
								-->
								</div>
							</form>
						</article>
					</div>
					<!-- card.// -->

				</div>
				<!--container end.//-->

			</div>

			<!-- cnotentarea end -->
		</div>

		<div id="bottomarea"><jsp:include page="/common/Bottom.jsp"></jsp:include></div>

		<!-- fullwrap end -->
	</div>

</body>
</html>