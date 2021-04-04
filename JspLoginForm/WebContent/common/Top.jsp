<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">


<!-- Bootstrap CSS CDN -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
	integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
	crossorigin="anonymous">
	

<!-- 부트스트랩 사이드마, 메뉴바 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/menu.css">

<!-- 본문 구조 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/join.css">

<!-- Scrollbar Custom CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">

<!-- Font Awesome JS -->
<script defer
	src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js"
	integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ"
	crossorigin="anonymous"></script>
<script defer
	src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js"
	integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY"
	crossorigin="anonymous"></script>

<title>Insert title here</title>
</head>
<body>

	<!-- 헤드 메뉴 s-->

		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container-fluid">

				<button type="button" id="sidebarCollapse" class="btn btn-info" style="background-color: #007bff;">
					<i class="fas fa-align-left"></i> <span>Menu</span>
				</button>
				<button class="btn btn-dark d-inline-block d-lg-none ml-auto"
					type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation" style="background: #007bff;">
					<i class="fas fa-align-justify"></i>
				</button>

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="nav navbar-nav ml-auto">
						<li class="nav-item active"><a class="nav-link" href="Ex02_JDBC_Main.jsp">Main</a>
						</li>
						<!--  							
						<li class="nav-item"><a class="nav-link" href="Ex02_JDBC_Login.jsp">Login</a></li>
						-->
						
						<li class="nav-item">
											<%
	if(session.getAttribute("userid") != null){
		out.print("<a class='nav-link'>"+session.getAttribute("userid") +"님</a></li>");
		out.print("<a class='nav-link' href='Ex02_JDBC_Logout.jsp'>Logout</a>");
	}else{
		out.print("<a class='nav-link' href='Ex02_JDBC_Login.jsp'>Login</a>");
	}
%></li>
						<li class="nav-item"><a class="nav-link" href="Ex02_JDBC_JoinForm.jsp">Resister</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="Help.jsp">Help</a></li>
						
						
					</ul>
					

				</div>
			</div>
		</nav>

</body>
</html>

