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


<!--  
CREATE TABLE koreaMemberboard
(
    title VARCHAR2(50) PRIMARY KEY ,
    pwd VARCHAR2(50) NOT NULL,
    name VARCHAR2(50) NOT NULL,
    email VARCHAR2(50),
    ip   VARCHAR2(50),
    text varchar2(200) not null
);
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