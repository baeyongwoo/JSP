<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//post방식일 때 아래 하나 써주기
	request.setCharacterEncoding("utf-8");
	//폼에서 던진 데이터를 받기 위해서는 request.getParameter("name값")
	//을 활용
	//name = "apple"에서 던진 데이터를 받기 위해서는
	String id = request.getParameter("id");
	//name = "banana"에서 던진 데이터를 받기 위해서는
	String pw = request.getParameter("pw");
	String email = request.getParameter("email");
	//String hobby = request.getParameter("hobby");
	//체크박스는 복수의 데이터가 넘어올수 있기 때문에
	//request.getParameterValues("name명");dmf tkdyd
	String[] hobby = request.getParameterValues("hobby");
	String[] best = request.getParameterValues("best");
	
	String gender = request.getParameter("gender");
	String lo = request.getParameter("location");
	String grade = request.getParameter("grade");
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	
</head>
<body>
		아이디 : <b><%= id %></b> <br/>
		비밀번호 : <b><%= pw %></b> <br/>
		이메일 : <b><%= email %></b> <br/>
		취미 :
		<%for(String name : hobby){ %>
		 <b><%= name %></b>&nbsp;
		 <% }%> <br/>
		특기 : <%=Arrays.toString(best) %><br/>		
		성별 : <%=gender %> <br/>
		지역 : <%=lo %> <br/>
		등급 : <%=grade %>
		
</body>
</html>