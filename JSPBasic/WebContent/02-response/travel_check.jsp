<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String city = request.getParameter("city1");
	
	if(city.equals("SEOUL")){
		response.sendRedirect("travel_SEOUL.jsp");
	}else if(city.equals("LA")){
		response.sendRedirect("travel_LA.jsp");
	}else if(city.equals("BANG")){
		response.sendRedirect("travel_BANG.jsp");
	}else if(city.equals("HONG")){
		response.sendRedirect("travel_HONG.jsp");
	}else {
		out.println("현재 선택한 도시는 안내할 수 없습니다.");
	}

%>