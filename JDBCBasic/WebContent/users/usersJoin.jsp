<%@page import="kr.co.ictedu.UsersVO"%>
<%@page import="kr.co.ictedu.UsersDAO"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//DB연동 이전에 먼저 join_form에서 날려주는 데이터를
	// 받아서 저장해줌
	response.setCharacterEncoding("utf-8");
	request.setCharacterEncoding("utf-8");
	
	String Id = request.getParameter("id");
	String Pw = request.getParameter("pw");
	String Name = request.getParameter("name");
	String Email = request.getParameter("email");
	
	// 기존에 있던 회원 가입 로직은 DAO클래로 이관
	// DAO 클래스 받아오기
	UsersDAO dao = UsersDAO.getInstance();
	
	//VO 객체 생성 및 uid, upw, uname, email setter로 입력해주기
	UsersVO user = new UsersVO(Id, Pw, Name, Email);
	
	dao.joinUsers(user);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 페이지</title>
</head>
<body>
	<h1>회원 가입을 축하합니다.</h1>
	<a href="userLoginForm.jsp">로그인하러 가기</a>
</body>
</html>