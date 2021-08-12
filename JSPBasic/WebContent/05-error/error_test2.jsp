<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%@ page errorPage="error_page.jsp" %>
<%
	//에러 발생했을 경우 위에 페이지로 연결
	int a = 3/0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	나누기의 결과값은 <%=a %>입니다.
</body>
</html>