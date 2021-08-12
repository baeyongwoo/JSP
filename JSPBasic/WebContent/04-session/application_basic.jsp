<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
		application은 application객체를 사용해서 저장하거나
		데이터 값을 받아올수 있음
		
		getAttribute() 메서드와
		setAttribute() 메서드를 사용할 수 있으며
		
		application 객체에 저장된 값은 어떤 브라우저에서 접근해도
		같은 값을 줌
		
		application 객체에 한 번 저장된 데이터는
		서버를 끄기 전까지 유지됨

		
	*/
	int visitCnt = 0;

	Integer temp = (Integer)application.getAttribute("visit");
	if(temp != null){
		visitCnt = temp;
	}
	visitCnt++;
	
	application.setAttribute("visit", visitCnt);
%>
<hr/>
	<h3>방문자 수 : <%= visitCnt%></h3>