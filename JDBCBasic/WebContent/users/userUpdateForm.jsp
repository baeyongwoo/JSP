<%@page import="kr.co.ictedu.UsersVO"%>
<%@page import="kr.co.ictedu.UsersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	// 1.세션을 통해 아이디를 가져온다
    	// 	만약 로그인 상태가 아니면 로그인 창으로 리다이렉트
    	String uidS = (String)session.getAttribute("userId");
		
    	if(uidS ==null){
    		response.sendRedirect("userLoginForm.jsp");
    	}
    	// 2. dao를 통해 UsersVo를 가지고 온다.
    	UsersDAO dao = UsersDAO.getInstance();
    	// 3. 가져온 UsersVO를 이용해 아래 html태그의 value속성에
    	// UsersVO의 정보를 기입하게 만듬
    	UsersVO user = new UsersVO();
    	user.setUid(uidS);
    	UsersVO preData = dao.getUserInfo(user);
    	
		System.out.println(preData);
		
		//resultData내부의 데이터가 null인 경우 조회가 실패한 경우 다시 로그인창으로
		if(preData.getUid() == null){
			session.invalidate();
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
	<h2>회원 수정하기</h2>
	<form action="userUpdateOk.jsp" method="post">
		<input type="text" name="id" readonly required value="<%=preData.getUid() %>" ><br>
		<input type="password" name="pw" required placeholder="비밀번호"><br>
		<input type="text" name="name"  required value="<%=preData.getUname() %>" ><br>
		<input type="email" name="email" value="<%=preData.getemail() %>" ><br>
		<input type="submit" value="변경완료">
	
	
	</form>
</body>
</html>