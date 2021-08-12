<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%
    	String Id = request.getParameter("Id");
   %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 성공</title>
</head>
<body>
	<b><%=Id %></b>님 환영합니다.
	<a href="req_login_form.jsp">로그인으로 돌아가기</a>
</body>
</html>