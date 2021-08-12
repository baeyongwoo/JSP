<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		body {background-color: black;}
	</style>
</head>
<body>
	<h1 style="color: red;">게시물 목록.</h1>
	<h3 style="color: white" align="left"><a href="/MyFirstWeb/userlogout.do">로그아웃하기</a></h3>
	<table border="1">
		<thead align="center" style="color: yellow;">
			<tr>
				<td>글번호</td>
				<td>글제목</td>
				<td>글쓴이</td>
				<td>글쓴날짜</td>
				<td>조회수</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="board" items="${boardList}">
				<tr align="center" style="color: white;">
					<td>${board.bId}</td>
					<td><a href="http://localhost:8181/MyFirstWeb/boarddetail.do?bid=${board.bId}">${board.bTitle}</a></td>
					<td>${board.bName}</td>
					<td>${board.bDate}</td>
					<td>${board.bHit}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<a href="http://localhost:8181/MyFirstWeb/board/board_write_form.jsp">글쓰러 가기</a>
</body>
</html>