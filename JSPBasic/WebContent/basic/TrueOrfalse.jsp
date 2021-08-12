<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!
		public boolean TrueOrFalse(int a, int b){
		if(a >= b) return true;
		else return false;
		
	}
	%>
	<p>스크립틀릿으로 출력된 값 : <b> <% out.print(TrueOrFalse(5, 3)); %></b></p> <br>
	<p>표현식으로 출력된 값 : <b><%=TrueOrFalse(5, 3) %> </b> <p>
	

</body>
</html>