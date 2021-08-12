<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
   	int age = Integer.parseInt(request.getParameter("age"));
   
   	if(age >= 20) response.sendRedirect("res_ok.jsp");
   	else response.sendRedirect("res_no.jsp");
   	
   %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
</body>
</html>