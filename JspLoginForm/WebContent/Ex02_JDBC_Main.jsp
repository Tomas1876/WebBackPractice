<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

#mainbtn {
	position:absolute;
	left:40%;
	width:20%;
	margin:50px auto;
	background: #007bff;
	color:white;
	border:none;
	outline:none;
	box-sizing:border-box;
	padding:5px;
}

#chaingingarea article {
	margin-top:50px;
	color:black;
	text-align: center;
}

</style>
</head>
<body>

	<div id="fullwrap">

		<div id="header"><jsp:include page="/common/Top.jsp"></jsp:include></div>
		<div id="contentarea">

			<div id="leftarea"><jsp:include page="/common/Left.jsp"></jsp:include></div>
			<div id="chaingingarea">
			
			<!-- MAIN PAGE CONTENT  -->
			<article>
				<%
					String id = null;
					id = (String)session.getAttribute("userid");
					
					if(id != null){
						//회원
						out.print(id + " 회원님 반갑습니다!<br>");
						if(id.equals("admin")){ %>
						
						<input type='button' value='회원관리' onclick='location.href="Ex03_Memberlist.jsp"' id='mainbtn'></input> 
							<%
						}
					}else{
						//로그인 하지 않은 사용자
						//메인 페이지는 회원만 볼수 있어요 (강제 링크 추가)
						out.print("환영합니다!<br>로그인 해주세요!"); %>
						
						<input type='button' value='로그인' onclick='location.href="Ex02_JDBC_Login.jsp"' id='mainbtn'></input> 

						<%	

					}
				%>
				</article>
				
			</div>
	
		<!-- contentarea end -->	
		</div>

	<!-- fullwrap end -->
	</div>
	<jsp:include page="/common/Bottom.jsp"></jsp:include>

</body>
</html>


