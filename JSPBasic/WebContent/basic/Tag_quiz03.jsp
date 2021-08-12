<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="java.lang.reflect.Array"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로또번호 생성 결과</h1>
	<p>이번주 로또 번호는 이 것</p>
	<p>
		<%! public static final int max = 6; %>
		<%
		int lotto[] = new int[max];
		
		
			for(int i = 0; i < max; i++) {	
				lotto[i] = (int)(Math.random()*45) + 1;	
			for(int j =0; j < i; j++) {	
				if(lotto[i]==lotto[j]) {
				i--;
				}
			}
		}%>
		<% Arrays.sort(lotto);
		
			for(Integer i : lotto){
				out.println(i + "&nbsp;");
				Thread.sleep(700);	//cpu를 잠시 멈추는 메서드
				out.flush();//브라우저의 출력 버퍼를 비우는 메서드
			}
		%>
	
</body>
</html>