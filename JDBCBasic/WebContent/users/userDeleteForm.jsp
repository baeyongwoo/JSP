<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
		String de_id = (String) session.getAttribute("userId");
		if (de_id == null) {
			response.sendRedirect("userLoginForm.jsp");
			}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 회원탈퇴시 <id>회원탈퇴를 진행합니다
		비밀번호를 한 번 더 입력해주세요라는 안내와 함께 비밀번호를 한 번 더 입력하는 폼을 만들기
	 -->
	<h2>회원탈퇴 창</h2>
	<h4><%=de_id%>님의 회원탈퇴를 진행합니다. 비밀번호를 한 번 더 입력해주세요
	</h4>
	<form action="userDeleteOk.jsp" method="post">
		<input type="password" name="de_pw" placeholder="pw"><br>
		<input type="submit" value="회원탈퇴">
	</form>

</body>
</html>