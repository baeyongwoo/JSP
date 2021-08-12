<%@page import="kr.co.ictedu.UsersVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.ictedu.UsersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
    <%
    	String s_id = (String)session.getAttribute("userId");
    	
    	if(s_id == null) {
    		response.sendRedirect("userLoginForm.jsp");
    	} 
    	//DB에서 전체 회원 데이터를 들고 옴
    	// 1.getAllUser()메서드를 dao를 이용해 호출
    	// 호출시 리턴되는 ArrayList를 변수에 담기
    	
    	UsersDAO dao = UsersDAO.getInstance();
    	ArrayList<UsersVO> userList = dao.getAllUser();
    	// 디버깅 결과 DB내 전체 데이터가 출력되면 성공
    	System.out.println(userList);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>전체 회원 목록</h1>
	
	<table border="1">
	
		<thead>
			<tr>
				<th>회원 아이디</th>
				<th>회원 이름</th>
				<th>회원 이메일</th>
			</tr>	
		</thead>
		<tbody>
		<%--userLIst는 VO의 집합이고, 여기서
		UsersVO를 하나하나 순차적으로 뽑아서 출력해야 하므로
		향상된 for사용
		 --%>
		 <%-- 
		<% for(UsersVO user : userList) {%>
			<tr>
				<td><%=user.getUid() %></td>
				<td><%=user.getUname() %></td>
				<td><%=user.getemail() %></td>
			</tr>
			<%} %>
			--%>
			<%-- JSTL 적용 버전 
			forEach 구문은 반복문이고, Items에 향상된 for문의 우측, var는 왼쪽
			--%>
			<c:forEach var="user" items="<%=userList %>">
			<tr>
				<td>${user.uid}</td>
				<td>${user.uname}</td>
				<td>${user.email}</td>
			</tr>	
			</c:forEach>
			
		
		</tbody>
	</table>
	<a href="userLoginForm.jsp">로그인폼</a>
	
</body>
</html>