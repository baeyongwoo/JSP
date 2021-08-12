<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<form action="/MyFirstWeb/login.do" method="post">
		<input type="text" name="uId" placeholder="id"><br/>
		<input type="password" name="uPw" placeholder="pw"><br/>
		<input type="submit" value="로그인">
	
	</form>
	
	<a href="user_join.jsp">회원가입하러가기</a>
	
</body>
</html>