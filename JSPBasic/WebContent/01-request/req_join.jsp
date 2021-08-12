<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String Id = request.getParameter("joinId");
	String Pw = request.getParameter("joinPw");
%>
<!DOCTYPE html>
<html>


<% if(Id.equals("abcd")) { %>

<head>
<meta charset="UTF-8">
<title>회원가입 실패</title>
</head>
<body>
	<%= Id %><b>는 중복된 아이디입니다. 다른이름으로 다시 기입해주세요</b>
	<a href="req_join_form.jsp">회원가입창으로 돌아가기</a>
	
</body>
	<% } else { %>
	
<head>
<meta charset="UTF-8">
<title>회원가입 성공</title>
</head>
<body>
	<b><%= Id %></b>님 회원가입을 축하합니다!<br/>
	<a href="req_login_form.jsp">로그인창으로 돌아가기</a>
	
</body>
<% } %>

</html>