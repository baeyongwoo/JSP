<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
      <%
    	String Id = request.getParameter("Id");
    	String Pw = request.getParameter("Pw");
   	 	%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<% if(Id.equals("abcd") && Pw.equals("1234")){
			response.sendRedirect("req_login_access.jsp");
		}else if(Id.equals("abcd")){
			response.sendRedirect("req_login_fail.jsp");
		} else {
		%> <b>아이디가 없습니다.</b>
		<%} %>
		<a href="req_login_form.jsp">로그인으로 돌아가기</a>
		
</body>
</html>