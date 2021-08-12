<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
	session_login.jsp에서 보내온 데이터를 획득한 다음
	id가 "kkk1234", pw가 "1111"인지 비교해서 둘 다 통과한 경우
	session_id에 id를, "session_pw에" pw를 session_nick에 nickname을 저장
	후 session_welcome.jsp로 보냅
	
	만약 둘다 통과하지 못했다면 다시 session_login.jsp로 리다이렉트
	
	*/
	
	request.setCharacterEncoding("utf-8");
		
	String Id = request.getParameter("id");
	String Pw = request.getParameter("pw");
	String Nick = request.getParameter("nick");
	
	
	if(Id.equals("kkk1234") && Pw.equals("1111")){
		session.setAttribute("id_session", Id);
		session.setAttribute("pw_session", Pw);
		session.setAttribute("nick_session", Nick);
		response.sendRedirect("session_welcome.jsp");
	} else {
		response.sendRedirect("session_login.jsp");
		
	}
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>

</html>