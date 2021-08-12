<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구구단 출력 예제</title>
</head>
<body>
	
		<% for(int i =2; i <= 9; i++){%> 
			<%
			if(i % 2==1){ %>
				<h2>구구단  
			 <% out.println(i); %>단</h2><hr/>  
		<p>
		<% 	
			for(int j = 1; j<= 9; j++){
				out.println(i + "x" + j + "=" + i*j + "</br>"); }%>
				
		<% 	}%>
		</p>
			
		<% 
		}
		%>
		


</body>
</html>