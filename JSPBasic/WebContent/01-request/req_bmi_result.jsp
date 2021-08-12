<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	
	double weight = Double.parseDouble(request.getParameter("weight")); 
	double height = Double.parseDouble(request.getParameter("height")); 
	bmi = weight / Math.pow(height*0.01, 2);
%>
<%!
	double bmi;
	public String bmiCal(double weight, double height){
		
		if(bmi > 23)
			return "당신은 과체중입니다.";
		else if(bmi < 18.5)
			return "당신은 저체중입니다";
		else return "당신은 정상체중입니다.";
		
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BMI 계산 웹어플리케이션</title>
</head>
<body>
	 <b><h2>BMI 계산 웹어플리케이션</h2></b> <hr>
	 -신장 : <%= (int)height %>cm<br>
	 -체중 : <%= (int)weight %>kg<br>
	BMI 지수 : <b><%=bmi %></b> <br>
	<b><%=bmiCal(weight, height) %></b>
	
	
	
	
	
	
	
	
	
	
</body>
</html>