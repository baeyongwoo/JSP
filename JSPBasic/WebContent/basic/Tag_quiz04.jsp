<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%! 
	List<String> jobs = new ArrayList<>();
	String job;
	%>
	
	<%
		while(jobs.size()<10){
		int num = (int)(Math.random()*5) + 1;
		switch(num){
			case 1:	job="전사";
			break;
			case 2: job="도적";
			break;
			case 3: job="궁수";
			break;
			case 4: job="해적";
			break;
			default :job="법사";
			break;
			}
		
			jobs.add(job);
		}
		%>
		<%!
		public String myJob(){
			
				return jobs.get(0);
		}
		%>
		<%
		int count = 0;
			
			for(String p : jobs){
				if(p.contains(myJob())) count++;
				}
	
		%>

	<h1>당신의 역할</h1>
	<p>
		당신에게 부여된 역할은 <b><%=myJob()%></b>입니다.<br> 
		현재 파티에 당신과 같은 역할을 가진 플레이어는
		 <%= count %>명입니다.
	</p>
	<p>
		현재 파티 구성<br>
		<%=jobs.toString() %>(<%=jobs.size() %>명 참가중)
	</p>
	<%
		if(jobs.size()==10) 
			jobs.clear();
	%>



</body>
</html>