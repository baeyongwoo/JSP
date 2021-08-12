<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1 style="color: blue;">글제목 : ${board.bTitle}</h1>
	<a href="http://localhost:8181/MyFirstWeb/boardlist.do"><input
		type="button" value="목록으로"></a>
	<table border="1">
		<tr>
			<td>글 번호 : ${board.bId}</td>
		</tr>
		<tr>
			<td>작성자 : ${board.bName}</td>
		</tr>
		<tr>
			<td><textarea rows="30px" cols="50px" readonly="readonly">${board.bContent}</textarea></td>
		</tr>
		<tr>
			<td>작성일자 : ${board.bDate}</td>
		</tr>
		<tr>
			<td>조회수 : ${board.bHit}</td>
		</tr>
		<tr>
			<td>
				
				<form action="/MyFirstWeb/boardupdate.do" method="post">
					<input type="hidden" name="bid" value="${board.bId }">
					<input type="submit" value="수정하기">
				</form>
			</td>
			<td>
			<form action="http://localhost:8181/MyFirstWeb/boarddelete.do"
					method="post">
					<input type="hidden" value="${board.bId }" name="bid"> 
					<input type="submit" value="삭제하기" />
				</form></td>
			<!--  삭제버튼 클릭했을 떄 해당 글이 db에서 삭제되도록 dao 구성 
					서비스에서 삭제가 완료되면 리스트 페이지로 돌아오도록 만들어줌
				-->

		</tr>
	</table>
</body>
</html>