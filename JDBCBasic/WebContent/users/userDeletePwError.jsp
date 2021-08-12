<%@page import="kr.co.ictedu.UsersVO"%>
<%@page import="kr.co.ictedu.UsersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String ids = (String) session.getAttribute("userId");
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2><%=ids%>님의 비밀번호가 잘못 입력되어 강제 로그아웃되었습니다.</h2>
	
	
	<a href="userLoginForm.jsp">다시 로그인하기</a>
</body>
</html>