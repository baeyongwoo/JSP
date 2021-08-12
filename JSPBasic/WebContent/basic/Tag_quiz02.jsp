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
		public int count; 
		public String gift(){
		if(count >= 10 && count%10==1){
			return "당첨";	
			}
		else return " ";
		}
		
		%>
	<!-- 21~23줄은 이클립스 버그 -->
	<p>페이지 누적 요청 수 : <%=count++ %><p>
	<p>매 <b>10</b>번째 방문자에게는 기프트콘을 드립니다.<p>
	<%=gift() %>
	<hr>
	<%int dan = (int)(Math.random()*9) + 1; %>
	<h2>랜덤 구구단 (<% out.println(dan);%>단)</h2>
	<p>이번에 나온 구구단은 <%=dan%> 단입니다.</p>
	
		<%  	
			for(int j = 1; j<=9 ; j++){
				out.println(dan + "x" + j + "=" + dan*j + "</br>"); 
				}
		%>
				
		







</body>
</html>