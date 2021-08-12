<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//세션이 존재하면 바로 user_login.ok.jsp로 보내주는 로직
	String ids = (String)session.getAttribute("userId");

	if(ids != null){
		response.sendRedirect("userLoginOk.jsp");
	} 
%>

<!DOCTYPE html>
<html>
<head>
	<style>
		body {
			background-image: url('forest.jpg');		
			background-repeat: none;
			background-size: cover;				
		}
		h2 {
			background-color:white;
			color: blue;
			background-position: 50px;
		}
		a {
			background-color: red;
			color: white;
		}
	</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h2>로그인 창</h2>
	<form action="userLoginOk.jsp" method="post">
		<input type="text" name="id" placeholder="id"><br/>
		<input type="password" name="pw" placeholder="pw"><br/>
		<input type="submit" value="로그인">
	
	</form>
	<a href="usersJoinForm.jsp">회원가입하러가기</a>
	
</body>
</html>