<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	// 세션에 저장된 id, nickname 정보를 꺼내서 변수 id, nick에 저장 후
	//body태그 내부에
	
 	//
	String id = (String)session.getAttribute("id_session");
	String nick = (String)session.getAttribute("nick_session");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3><%=nick%>(<%=id%>)님 환영합니다</h3><hr>
	<h2>수학공부하기</h2>
	<a href="http://localhost:8181/JSPBasic/basic/gugudan.jsp">구구단으로 가기</a><br>
	<hr>
	<h2>태그 복습</h2>
	<a href="http://localhost:8181/JSPBasic/basic/Tag_quiz01.jsp">태그퀴즈1</a><br>
	<a href="http://localhost:8181/JSPBasic/basic/Tag_quiz02.jsp">태그퀴즈2</a><br>
	<a href="http://localhost:8181/JSPBasic/basic/Tag_quiz03.jsp">태그퀴즈3</a><br>
	<a href="http://localhost:8181/JSPBasic/basic/Tag_quiz04.jsp">태그퀴즈4</a>
	
	<%-- 페이지 include : 다른 페이지의 소스코드를 그대로
	현재 페이지에 붙여넣어 줄떄 쓰는 문법 --%>
	<%@ include file="application_basic.jsp" %>
	<br/>
	<hr>
	<a href="session_logout.jsp">로그아웃하기</a>
	
</body>
</html>