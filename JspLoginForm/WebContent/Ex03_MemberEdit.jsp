<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
	<!-- 권한검사 -->
	<jsp:include page='/common/Check.jsp'></jsp:include>
	
<%
	/* 
	회원정보 수정하기
	1.DB 쿼리 : 2개 (수정정보 : select , 수정정보반영 : update)
	 1.1 : select * from koreamember where id=?
	 1.2 : update koreamember set ename=? where id=?		 
	2.화면 1개(기존에 입력내용 보여주는 것)-> 처리 1개 (수정처리)
	 2.1  DB select 한 결과 화면 출력 
	   <input type="text" value="rs.getString(id)">
	      수정(x) 화면출력(O) 전송(x) : <td>rs.getString("id")</td> - 텍스트
	      수정(x) 화면출력(O) 전송(O)   : <input type="text" value="rs.getString(id)" name="id" readonly>
	      수정(O) ..화면출력(O) 전송(O)   :  <input type="text" value="rs.getString(id)" name="id">
	      
	      >> 서버에 전송하려면 name 속성이 있어야 한다
	      	 화면에 출력할 때 가장 중요한 것은 수정가능 여부와 서버 전송여부다 이걸 케이스별로 판단해야 한다
	      	 보통 알아보기 쉽게 수정할 수 있는 것은 색을 다르게 하거나, placeholder를 걸면 된다
	
	
	if(session.getAttribute("userid") == null || !session.getAttribute("userid").equals("admin") ){
		//강제로 페이지 이동
		out.print("<script>location.href='Ex02_JDBC_Login.jsp'</script>");
	}
	*/
    request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	
	
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try{
		conn = Singleton_Helper.getConnection("oracle");
		String sql="select id,pwd,name,age,trim(gender),email from koreamember where id=?";
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1,id);
		
		rs = pstmt.executeQuery(); 
		
		//while(rs.next())
		rs.next(); //1건 데이터가 있다면 전제조건
%>	
	
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
	
	<!-- 본문 구조 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/join.css">

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
							<h4 class="card-title mt-3 text-center">회원정보 수정</h4>

							<form action="Ex03_MemberEditok.jsp" method="post">

								<div class="form-group input-group">
									<div class="input-group-prepend">
										<span class="input-group-text"> <i class="fa fa-user"></i>
										</span>
									</div>
									<!-- id -->
									<input class="form-control" type="text"
										name="id" id="id" value="<%=rs.getString(1)%>" readonly>
								</div>

								<div class="form-group input-group">
									<div class="input-group-prepend">
										<span class="input-group-text"> <i class="fa fa-lock"></i>
										</span>
									</div>
									<!-- 비밀번호 -->
									<input class="form-control" placeholder="<%= rs.getString(2) %>" type="password"
										name="pwd" id="pwd" readonly>
								</div>

								<div class="form-group input-group">
									<div class="input-group-prepend">
										<span class="input-group-text"> <i class="fa fa-user"></i>
										</span>
									</div>
									<!-- 이름 -->
									<input name="name" id="name" class="form-control"
										placeholder="이름 <%=rs.getString(3)%>" type="text">
								</div>

								<div class="form-group input-group">
									<div class="input-group-prepend">
										<span class="input-group-text"> <i class="fa fa-user"></i>
										</span>
									</div>
									<!-- 나이 -->
									<input type="text" name="age" value="나이 <%=rs.getString(4)%>" id="age" maxlength="3"
										class="form-control">
								</div>

								<!-- form-group// -->
								<div class="form-group input-group">
									<div class="input-group-prepend">
										<span class="input-group-text"> <i class="fa fa-user"></i>
										</span>
									</div>
									<!-- 성별 -->
									<div class="form-control">
									<%=rs.getString(5) %>
											<input type="radio" name="gender" id="gender" value="여"
											<%if (rs.getString(5).equals("여")){ %>checked<%}%>>여자 &nbsp; <input type="radio" name="gender"
											id="gender" value="남"<%if (rs.getString(5).equals("남")){ %>checked<%}%>>남자
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
									<input name="email" class="form-control" value="<%=rs.getString(6)%>"
										type="email">
								</div>


								<!-- form-group// -->
								<div class="form-group">
									<input type="submit" value="수정하기"
										class="btn btn-primary btn-block"> </input>
										<input type="button"
										onclick="location.href='Ex03_Memberlist.jsp'" value="리스트이동" class="btn btn-primary btn-block"></input>
								</div>

							</form>
						</article>
					</div>
					<!-- card.// -->

				</div>
				<!--container end.//-->

			</div>
				
			</div>
	
		<!-- cnotentarea end -->	
		</div>
	
		<div id="bottomarea"><jsp:include page="/common/Bottom.jsp"></jsp:include></div>
		
	<!-- fullwrap end -->
	</div>

</body>
</html>
<%
	}catch(Exception e){
		
	}finally{
		Singleton_Helper.close(rs);
		Singleton_Helper.close(pstmt);
	}

%>
