<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	String id = request.getParameter("joinId");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>로그인 창입니다.</h2>
	<form action="req_login.jsp" method="post">
		아이디 입력 : <input type="text" name="Id"> <br/>
		비밀번호 입력 : <input type="password" name="Pw"> <br/>
		<input type="submit" value="로그인"> &nbsp;
		<input type="reset" value="초기화"> &nbsp;
		<a href="req_join_form.jsp">회원가입</a>
	</form>
</body>
</html>