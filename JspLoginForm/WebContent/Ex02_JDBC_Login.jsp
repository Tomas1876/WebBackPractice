<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/join.css">

<!-- 로그인 템플릿 링크들 -->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>

	<div id="fullwrap">

		<div id="header"><jsp:include page="/common/Top.jsp"></jsp:include></div>
		<div id="contentarea">

			<div id="leftarea"><jsp:include page="/common/Left.jsp"></jsp:include></div>
			<div id="chaingingarea">

				<div class="container">

					<div class="card">
						<article class="card-body mx-auto" style="max-width: 400px;">
							<h4 class="card-title mt-3 text-center">로그인</h4>

							<form action="Ex02_JDBC_loginok.jsp" method="post"
								name="loginForm" id="joinForm">

								<div class="form-group input-group">
									<div class="input-group-prepend">
										<span class="input-group-text"> <i class="fa fa-user"></i>
										</span>
									</div>
									<!-- id -->
									<input class="form-control" placeholder="아이디" type="text"
										name="id" id="id">
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
								<div class="form-group">
									<input type="submit" value="로그인"
										class="btn btn-primary btn-block"> </input> <input
										type="reset" value="취소" class="btn btn-primary btn-block"></input>

									<p>
										<br>
										<a href="Ex02_JDBC_JoinForm.jsp">아직 회원이 아니신가요? </a>
									</p>
								</div>
								<!-- form-group// -->

							</form>
						</article>
					</div>
					<!-- card.// -->

				</div>
				<!--container end.//-->





			</div>
			</form>

		</div>

		<!-- contentarea end -->
	</div>

	<jsp:include page="/common/Bottom.jsp"></jsp:include>

	<!-- fullwrap end -->
	</div>

</body>
</html>