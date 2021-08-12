<%@page import="kr.co.ictedu.UsersDAO"%>
<%@page import="kr.co.ictedu.UsersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
    	// 1.폼에서 던져준 데이터를 받는다.
    	String newId = request.getParameter("id");
    	String newPw = (String)request.getParameter("pw");
    	String newName = (String)request.getParameter("name");
    	String newEmail = (String)request.getParameter("email");
    	
    	// 2.던져준 데이터를 VO를 생성해 담는다
    	UsersVO user = new UsersVO(newId, newPw, newName, newEmail);
  
    	
    	// 3.dao를 생성해 usersUpdate(); 메서드를 호출
    	UsersDAO dao = UsersDAO.getInstance();
    	dao.usersUpdate(user);
    	
    	int result = dao.usersUpdate(user);
    	// 4. 업데이트 성공시 1, 실패시 0을 리턴
    	// 	0을 리턴받았을때는 user_update_fail.jsp로 리다이렉트
   		System.out.println("update 결과코드" + result); 
    	
    	if(result==1){
    		//1을 리턴받았을때는 하단 body태그 내에 <계정명> 수정이 완료
    		//라는 메세지와 다시 로그인폼으로 돌아가는 링크를 띄우기
    		System.out.println("update 반영된 정보" + dao.getUserInfo(user));
    		session.invalidate();
    	}
    	//5. user_update_fail.jsp는 body 태그 내에
    	// 수정에 실패했습니다. 다시 시도해주세요.
    	// 라는 메세지와 그 아래에 로그인폼으로 돌아가는 링크를 띄워줌
    	else{
    		response.sendRedirect("userUpdateFail");
    	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		
		<h2><%=user.getUid() %> 수정이 완료</h2>
		<a href="userLoginForm.jsp">로그인 폼</a>
	
</body>
</html>