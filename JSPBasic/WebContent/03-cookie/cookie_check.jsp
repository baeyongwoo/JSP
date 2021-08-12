<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 클라이언트에 저장된 쿠키를 조회하는 방법.
	// request.getCookies(); 호출시 response.addCookie()로 발급된
	// 쿠키 중 해당 서버가 발급한 쿠키 전체 목록을 불러옴
	Cookie[] cookies = request.getCookies();
	
	String str = null;
	
	boolean flag = false;
	for(int i =0; i < cookies.length; i++){
		str = cookies[i].getName();// 쿠키이름 얻어오는 메서드
		System.out.println(str);
		
		if(str.equals("banana_cookie")){
			out.println("바나나 쿠키가 존재합니다.<br>");
			String value = cookies[i].getValue();
			out.println("저장된 자료는" + value + " 입니다");
			flag = true;
			break;
			
		}
	}
	if(!flag){
		out.println("바나나 쿠키가 사라졌습니다. <br>");
	}
%>