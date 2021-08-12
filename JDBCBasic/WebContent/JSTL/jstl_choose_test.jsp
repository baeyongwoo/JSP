<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
90점 이상이면 A학점
80점 이상이면 B학점
70점 이상이면 C학점
60점 이상이면 D학점

이외는 F학점

 --%>
 
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		
		<c:choose>
			<c:when test="${param.score > 100}">
				<p>점수는 100점 초과할수 없습니다.</p>
			</c:when>
			
			<c:when test="${param.score >=90}">
				<p>A학점입니다.</p>
			</c:when>
			<c:when test="${param.score >=80}">
				<p>B학점입니다.</p>
			</c:when>
			<c:when test="${param.score >=70}">
				<p>C학점입니다.</p>
			</c:when>
			<c:when test="${param.score >=60}">
				<p>D학점입니다.</p>
			</c:when>
			<c:otherwise>
				<p>F학점입니다.</p>
			</c:otherwise>
		</c:choose>
		
		<a href="jstl_choose_testform.jsp">다시 조회하기</a>
</body>
</html>