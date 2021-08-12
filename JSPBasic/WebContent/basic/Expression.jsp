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
		public String name = "김철수";
		public int age = 30;
		//아래에 원 넓이를 구하는 areaCircle을 선언후
		//아래쪽에 표현식 내부에서 호출하도록
		// 반지름을 입력받아서 (반지름의 제곱 * Math.PI);를
		//리턴하는 함수
		public double areaCircle(double r){
			return Math.pow(r, 2) *Math.PI;
		}
	%>

	<%
		out.print("이름 : " + name + "<br>");
		out.print("나이 : " + age + "<br>");
	%>
	이름 : <%= name %><br>
	나이 : <%= age %><br>
	원의 넓이 : <%= Math.round(areaCircle(5)*100) / 100.0 %>
	원의 넓이 : <%= areaCircle(5) %>
</body>
</html>