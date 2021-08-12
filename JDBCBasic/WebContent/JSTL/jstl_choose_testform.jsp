<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%--jstl_choose_test.jsp를 타겟으로 해서
점수를 입력하는 폼을 만들기--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>성적조회</h2>
	<form action="jstl_choose_test.jsp">
		<input type="text" name="score" placeholder="점수입력"><br>
		<input type="submit" value="학점 확인">
	</form>
</body>
</html>