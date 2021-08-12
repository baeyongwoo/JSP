<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원가입</h2>
	<form action="usersJoin.jsp" method="post">
		<input type="text" name="id" placeholder="id"><br>
		<input type="password" name="pw" placeholder="pw"><br>
		<input type="text" name="name" placeholder="name"><br>
		<input type="email" name="email" placeholder="000@0000"><br>
		<input type="submit" value="회원가입">
	</form>
</body>
</html>