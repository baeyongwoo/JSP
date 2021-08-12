<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>1부터 100까지의 합</h4>
	<c:set var="sum"/><%-- int sum = 0; --%>
	<c:forEach var="n" begin="1" end="100">
		<c:set var="sum" value="${sum + n }"/>
		<p>${n}까지 누적합 : ${sum} </p>
	</c:forEach>
	<%--
		for(int i=1; i <= 100; i++){
			sum += i;
		}
	
	 --%>
	 
	 <c:out value="${sum}"/>
	 
	 <h2>1~100까지 홀수의 합</h2>
	 <c:set var="sum"/><%-- int sum = 0; --%>
	<c:forEach var="n" begin="1" end="100" step="2">
		<c:set var="sum" value="${sum + n }"/>
		<p>${n}까지 누적합 : ${sum} </p>
	</c:forEach>
	<%--
		for(int i=1; i <= 100; i++){
			sum += i;
		}
	
	 --%>
	 
	 <c:out value="${sum}"/>
</body>
</html>