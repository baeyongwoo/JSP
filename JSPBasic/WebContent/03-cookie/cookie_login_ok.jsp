<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	//0. post방식 받아오기 처리
    	request.setCharacterEncoding("utf-8");
    	//1. 아이디 비밀번호 받아오기
    	String id = request.getParameter("id");
    	String pw = request.getParameter("pw");
    	
    	//2. checkbox가 체크되었는지 여부도 받아옴
    	String checkId = request.getParameter("id_check");
    	String checkPw = request.getParameter("pw_check");
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//id는 abc1234, 비밀번호는 aaa1111로 처리
	if(id.equals("abc1234") && pw.equals("aaa1111")){
		
		// 로그인 처리를 위한 쿠키 발급
		Cookie c = new Cookie("user_id", id);
		// 쿠키이름 "user_id", 쿠키값은 로그인할 때 사용한 id
		// 지속시간은 20초
		c.setMaxAge(20);
		// 완성 후 쿠키 발송
		response.addCookie(c);
		
		//체크박스가 체크되어 있을경우, 아이디 비밀번호 자동입력을 위한
		// 쿠키를 발급하기(20초)
		//"rememberber_id", "remember_pw" 를 쿠키이름으로
		// id, pw를 쿠키값으로 가지는 쿠키 2개를 생성해 발송까지
		//단, 쿠키 발급은 checkId, checkPw가 yes일때만 발급
		
		
		if(checkId != null && checkId.equals("yes")){
			Cookie cId = new Cookie("remember_id", id);
			cId.setMaxAge(20);
			response.addCookie(cId);
			
		} 
		if(checkPw != null && checkPw.equals("yes")){
			Cookie cPw = new Cookie("remember_pw", pw);
			cPw.setMaxAge(20);
			response.addCookie(cPw);
		}
		
		
		
		
	//로그인 성공시 cookie_welcome.jsp로 보내고
		response.sendRedirect("cookie_welcome.jsp");
	} else{
	//로그인 실패시 "로그인에 실패했습니다"라고 브라우저에 띄워주기
		out.println("로그인에 실패했습니다.<br>");
		out.println("<a href=\"cookie_login.jsp\">다시 로그인</a>");
	}
%>


</body>
</html>