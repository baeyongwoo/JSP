<%@page import="kr.co.ictedu.UsersVO"%>
<%@page import="kr.co.ictedu.UsersDAO"%>
<%@page import="javax.print.attribute.ResolutionSyntax"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
    	//비밀번호를 db쪽과 대조해서, 맞는 비밀번호라면
    	//delete구문을 실행해 삭제하고, 비밀번호가 틀리다면
    	// 바로 로그아웃을 강제로 시켜버리기
    	// user_login_ok.jsp를 수정해서 유저 패스워드도 세션을 같이 발급시켜서 user_delete_ok에서
    	//비밀번호 대조하는데 활용
    	String s_upw = (String)session.getAttribute("userPw");
    	String s_uid = (String)session.getAttribute("userId");
    	
    	String de_userPw = request.getParameter("de_pw");
	    	
    	// 1. DAO를 생성
    	// 2. UsersVO를 생성하되, spw, sessionId만 setter로 넣기
    	// 3. DATO deleteUsers 기능을 호출하면서 파라미터로 적절한 자료를 넣기
    	UsersDAO dao = UsersDAO.getInstance();
    	UsersVO user = new UsersVO();
    	user.setUpw(s_upw);
    	user.setUid(s_uid);
    	
    	//비밀번호 틀리게 입력할 경우 0;
    	int result = dao.usersDelete(user, de_userPw);
    	
    	if(result==0){
    		System.out.println(s_uid + "님의 올바르지 않는 비밀번호 : " + de_userPw + "시도");
    		response.sendRedirect("userDeletePwError.jsp");
    		
    	} 
    	session.invalidate();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2><%=s_uid %>회원탈퇴 처리 되었습니다.</h2>
	<a href="userLoginForm.jsp">로그인화면으로</a>
</body>
</html>