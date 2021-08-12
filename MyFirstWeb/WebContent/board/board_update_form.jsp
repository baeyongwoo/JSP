<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>글수정 창</h1>
	<form action="/MyFirstWeb/boardupdateok.do" method="post">
	<table border="1">
			<tr>
			<td>글 번호</td>
				<td>
				<input type="text" name="bId" value="${board.bId}" readonly="readonly">
				</td>
			</tr>
			<tr>
			<td>글 제목 </td>
			<td>
				<input type="text" name="bTitle" value="${board.bTitle}">
			</td>
			</tr>
			<tr>
				<td>글 내용 </td>
				<td>
					<textarea rows="10" cols="50" name="bContent" >${board.bContent}</textarea>	
				</td>
			</tr>
			<tr>
				<td>글쓴이</td>
				<td>
					<input type="text" name="bName" value="${board.bName}" readonly="readonly"><br>	
				</td>
			</tr>
			<tr>
				<td>작성시기</td>				
				<td>
					<input type="text" name="bDate" value="${board.bDate}" readonly="readonly"> 
				</td>
			</tr>
			<tr>
				<td>조회수</td>
				<td>
					<input type="text" name="bHit" value="${board.bHit}" readonly="readonly"> 
				</td>
			</tr>
			<tr>
				<td><input type="submit" value="수정완료"></td>
				<td><input type="reset" value="초기화"></td>
			</tr>
	</table>
	</form>

</body>
</html>