<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 회원가입 템플릿 링크들 -->

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


<!-- 본문 구조 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/join.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript">
	//jquery 로 간단하게 유효성 check 하기
	$(function() {
		$('#joinForm').submit(function() {
			//alert("가입");
			if ($('#id').val() == "") { // 아이디 검사
				alert('ID를 입력해 주세요.');
				$('#id').focus();
				return false;
			} else if ($('#pwd').val() == "") { // 비밀번호 검사
				alert('PWD를 입력해 주세요.');
				$('#pwd').focus();
				return false;
			} else if ($('#mname').val() == "") { // 이름 검사
				alert('mname를 입력해 주세요.');
				$('#mname').focus();
				return false;
			} else if ($('#age').val() == "") { // 나이 검사
				alert('age를 입력해 주세요.');
				$('#age').focus();
				return false;
			} else if ($('#email').val() == "") { // 우편번호
				alert('email를 입력해 주세요.');
				$('#email').focus();
				return false;
			}

		});
	});
</script>
<!--  
CREATE TABLE koreaMember
(
    id VARCHAR2(50) PRIMARY KEY ,
    pwd VARCHAR2(50) NOT NULL,
    NAME VARCHAR2(50) NOT NULL,
    age NUMBER ,
    gender CHAR(4),
    email VARCHAR2(50),
    ip   VARCHAR2(50)
)
-->

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
							<h4 class="card-title mt-3 text-center">회원가입</h4>

							<form action="Ex02_JDBC_JoinOK.jsp" method="post" name="joinForm"
								id="joinForm">

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

								<div class="form-group input-group">
									<div class="input-group-prepend">
										<span class="input-group-text"> <i class="fa fa-user"></i>
										</span>
									</div>
									<!-- 이름 -->
									<input name="mname" id="mname" class="form-control"
										placeholder="이름" type="text">
								</div>

								<div class="form-group input-group">
									<div class="input-group-prepend">
										<span class="input-group-text"> <i class="fa fa-user"></i>
										</span>
									</div>
									<!-- 나이 -->
									<input type="text" name="age" id="age" maxlength="3"
										class="form-control" placeholder="나이">
								</div>

								<!-- form-group// -->
								<div class="form-group input-group">
									<div class="input-group-prepend">
										<span class="input-group-text"> <i class="fa fa-user"></i>
										</span>
									</div>
									<!-- 성별 -->
									<div class="form-control">
										<input type="radio" name="gender" id="gender" value="여"
											checked> 여자 &nbsp; <input type="radio" name="gender"
											id="gender" value="남"> 남자
									</div>
								</div>

								<!-- form-group// -->
								<div class="form-group input-group">
									<div class="input-group-prepend">
										<span class="input-group-text"> <i
											class="fa fa-envelope"></i>
										</span>
									</div>
									<!-- 이메일 -->
									<input name="email" class="form-control" placeholder="Email address"
										type="email">
								</div>


								<!-- form-group// -->
								<div class="form-group">
									<input type="submit" value="회원가입"
										class="btn btn-primary btn-block"> </input> <input
										type="reset" value="취소" class="btn btn-primary btn-block"></input>
								</div>
								<!-- form-group// -->
								<p class="text-center">
									이미 계정이 있으신가요? <a href="Ex02_JDBC_Login.jsp">Login</a>
								</p>
							</form>
						</article>
					</div>
					<!-- card.// -->

				</div>
				<!--container end.//-->

			</div>

			<!-- cnotentarea end -->
		</div>

		<jsp:include page="/common/Bottom.jsp"></jsp:include>

		<!-- fullwrap end -->
	</div>

</body>
</html>