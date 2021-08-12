<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>글쓰기 창</h1>
	<form action="/MyFirstWeb/boardwrite.do" method="post">
	<table border="1">
		<thead>
			<tr>
			<td>글 제목 </td>
			<td>
				<input type="text" name="title" placeholder="필수입력" >
			</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>글 내용 </td>
				<td>
					<textarea rows="10" cols="50" name="content"></textarea>	
				</td>
			</tr>
			<tr>
				<td>글쓴이</td>
				<td>
					<input type="text" name="writer" value="${user.uName}" ><br>	
				</td>
			</tr>
			<tr>
				<td><input type="submit" value="글쓰기"></td>
				<td><input type="reset" value="초기화"></td>
			</tr>
		</tbody>
	</table>
	</form>
</body>
</html>