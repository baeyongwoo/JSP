<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<h2>회원가입 양식</h2>
	<form action="req_join.jsp" method="post">
		<!-- 아이디, 비밀번호, 제출버튼, 초기화버튼만들기 
		아이디는 =>joinId에 담기, 비밀번호는 joinPw에 담기
		-->
		ID : <input type="text" name="joinId" size="10px" placeholder="Id를 입력하세요" > <br/>
		PW : <input type="password" name="joinPw" size="10px" placeholder="pw를 입력하세요"><br/>
		<input type="submit" value="제출">
		<input type="reset" value="다시작성">
		
	
	</form>
</body>
</html>