<%@page import="org.apache.catalina.User"%>
<%@page import="kr.co.ictedu.UsersDAO"%>
<%@page import="kr.co.ictedu.UsersVO"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	response.setCharacterEncoding("utf-8");
    	request.setCharacterEncoding("utf-8");
    	
    	String uid = request.getParameter("id");
    	String upw = request.getParameter("pw");
    	
    	//if~else로 try~catch~finally를 감싸서
    	//세션이 존재할 때는 db에서 데이터를 가져올 때는 로직을 생략
    	String ids = (String)session.getAttribute("userId");
    	
    	// 폼에서 보낸 데이터와 db쪽 데이터간 비밀번호 일치여부 비교해서
    	// 아이디와 비밀번호 모두 일치시 세션 발급 및 body태그 출력
    	// 비밀번호가 틀린경우 user_login_fail.jsp
		if(ids != null){
			uid = ids;
		}else {
			// 1. dao 생성
			// dao로 로그인 검사
	    	UsersDAO dao = UsersDAO.getInstance();
	    	UsersVO user = new UsersVO();
			user.setUid(uid);
			user.setUpw(upw);
			
			int loginResultNum = dao.userLogin(user);
	    	System.out.println("결과코드 : " + loginResultNum);
	    	
	    	if(dao.userLogin(user) == 1){
	    		session.setAttribute("userId", uid);
	    		session.setAttribute("userPw", upw);
	    	}
	    	else if(dao.userLogin(user) == 0){
	    		System.out.println("로그인 실패한 아이디");
	    		System.out.println(uid);
	    		response.sendRedirect("userLoginFail.jsp");
	    	}
			
		}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>(Id : <%=uid %>)님 환영합니다.</h2><hr>
	<a href="http://localhost:8181/JSPBasic/basic/Tag_quiz01.jsp">태그퀴즈1</a><br>
	<a href="http://localhost:8181/JSPBasic/basic/Tag_quiz02.jsp">태그퀴즈2</a><br>
	<a href="http://localhost:8181/JSPBasic/basic/Tag_quiz03.jsp">태그퀴즈3</a><br>
	<a href="http://localhost:8181/JSPBasic/basic/Tag_quiz04.jsp">태그퀴즈4</a><hr>
	<a href="userLogout.jsp">로그아웃하기</a>
	<a href="userDeleteForm.jsp">회원탈퇴하기</a>
	<a href="userUpdateForm.jsp">회원정보 수정하기</a>
	<a href="userGetAll.jsp">회원목록</a>
</body>
</html>