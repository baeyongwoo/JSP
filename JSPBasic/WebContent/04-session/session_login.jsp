<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	p {color: red; size: 20px}
</style>
</head>
<body>
	<!-- form을 이용해 session_login_ok.jsp로 post방식으로 
		id, pw, nickname을 전송
	 -->
	 <form action="session_login_ok.jsp" method="post">
	 	<input type="text" name="id" placeholder="id" ><br/>
	 	<input type="password" name="pw" placeholder="pw" ><br/>
	 	<input type="text" name="nick" placeholder="nick" ><br/>
	 	<input type="submit" value="회원가입">
	 </form>
	

</body>
</html>