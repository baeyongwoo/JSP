<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>객체에 파라미터 전달 예제</title>
</head>
<body>
	<!-- form 내부에 input 4개를 만들기
		input태그에 type속성은 하나는 text, password, name 속성은 하나는 apple, banana
		제출, 리셋도 하나씩
	 -->
	 <!-- form태그의 action은 데이터가 전달될 목적지 -->
	 <!-- name은 택배 보낼 때 상자라고 생각 -->
	 <form action="req_param_getpost.jsp" method="post">
	 	아이디 : <input type="text" name = "id"/><br>
	 	비밀번호 : <input type="password" name = "pw"/><br>
	 	이메일 : <input type="email" name = "email"/><br>
	 	<!-- 체크박스 -->
	 	취미 : 
	 	<input type="checkbox" name="hobby" value="요리">요리&nbsp;
	 	<input type="checkbox" name="hobby" value="운동">운동&nbsp;<br/>
	 	<!-- 특기체크박스, 최소 5개 이상 -->
	 	특기 : 
	 	<input type="checkbox" name="best" value="축구">축구&nbsp;
	 	<input type="checkbox" name="best" value="프로그래밍">프로그래밍&nbsp;
	 	<input type="checkbox" name="best" value="게임">게임&nbsp;
	 	<input type="checkbox" name="best" value="네트워크">네트워크&nbsp;
	 	<input type="checkbox" name="best" value="잠자기">잠자기&nbsp;<br/>
	 	<!-- 성별 -->
	 	<input type="radio" name="gender" value="male">male&nbsp;
	 	<input type="radio" name="gender" value="female">female&nbsp;<br/>
	 	<!-- 지역 -->
	 	지역 : 
	 	<input type="radio" name="location" value="seoul">seoul&nbsp;
	 	<input type="radio" name="location" value="jejo">jejo&nbsp;
	 	<input type="radio" name="location" value="busan">busan&nbsp;<br/>
	 	<!-- select태그는 선택지를 드롭박스로 준다 -->
	 	등급 : 
	 	<select name="grade">
	 		<option>A+</option>
	 		<option>A</option>
	 		<option>B</option>
	 		<option>C</option>
	 		<option>F</option>
	 	</select>
	 	<br/>
	 	<input type="submit" value="제출"/>
	 	<input type="reset" value="리셋">
	 	
	 	
	 </form>
</body>
</html>