<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
 
 	Cookie [] cookies = request.getCookies();
 	// 로그인 창 만든 이후에 이미 로그인한 사람이 로그인창 오면
 	// 바로 로그인 완료창으로 보내주기 위해 작성할 부분
 	// "user_id" 쿠키 존재 여부를 따져서 리다이렉트 시킴
 	// cookie_welcome.jsp로 리다이렉트
 	for(Cookie c : cookies){
 		String cName = c.getName();
 		if(cName.equals("user_id"))
 		 	response.sendRedirect("cookie_welcome.jsp");	
 	}
 	
 	//만약 아이디/비밀번호 기억하기가 체크되어 있는 경우
 	//처리해주기 위해 쿠키에서 아이디/비밀번호 값을 추출하는 로직
 	
 	String id = "";
 	String pw = "";
 	
 	// cookies 변수에 쿠키가 여러개 들어있음
 	// 반복문을 이용해 하나하나 c에 번갈아 가면서 한번씩 대입해서 코드 진행
 	for(Cookie c : cookies){
 		
 		String idc = c.getName();
 		String pwc = c.getName();
 		if(idc.equals("remember_id")){
 			id = c.getValue();
 		}
 		if(pwc.equals("remember_pw")){
 			pw = c.getValue();
 		}
 		
 		
 	}
 	
 	System.out.println(id);
 	System.out.println(pw);
 	
 	
 	
 %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 로그인 폼에는 checkbox를 이용해 자동로그인 여부까지 체크 -->
	<form action="cookie_login_ok.jsp" method="post">
		<input type="text" name="id" placeholder="ID"
		value="<%= id%>">
		<input type="checkbox" name="id_check" value="yes">
		아이디 기억하기<br>
		<input type="password" name="pw" placeholder="PW" value="<%= pw%>">
		<input type="checkbox" name="pw_check" value="yes">
		비밀번호 기억하기<br>
		<input type="submit" value="로그인"/>
	</form>
	


</body>
</html>