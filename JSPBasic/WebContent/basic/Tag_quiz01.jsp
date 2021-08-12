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
		public int reply= 0;
	%>
	
	<% int reply_second = 1; %>
	
	<%! 
		public int luck(){
			int num = (int)(Math.random()*10) + 1;
			return num;
		}
	%>
	<%! 
		public String luck_color(){
			double color = Math.random();
			
			if(color >=0.66){
				return "빨강";
			}else if(color >= 0.33){
				return "노랑";
			}else {
				return "파랑";
			}
		}
	%>
	
	
	<h2>Web프로그래밍</h2>
	페이지 누적 요청수 : <%=reply++ %>, 페이지 개별 요청수 : <% out.println(reply_second++); %> 
	<h3>오늘의 행운의 숫자와 행운의 색깔</h3>
	<br>
	
	행운의 숫자 : <b><%= luck() %></b> <br>
	행운의 색깔 :   <%= luck_color() %>


</body>
</html>