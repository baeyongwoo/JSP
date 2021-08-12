<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행지 안내 페이지</title>
</head>
<body>
	<%-- 1. 폼 만들기 폼은 travel_check.jsp를 목적지로
		2. post방식으로 데이터 전송
		3. radio 버튼으로 관심사에 대한 항목을 나열(최소 4개) 
		4. radio 선택하고 submit을 누르면 각 radio의 value값을 분석해
		travel_check.jsp 내부 로직이 travel_도시이름.jsp로 리다이렉트
		5. travel_도시이름.jsp 결과페이지에는 관련도쇠의 유튜브 동영상을 게시
		--%>
		<h2>여행 소개 안내 페이지</h2> <hr>
		<form action="travel_check.jsp" method="post">
			<input type="radio" name="city1" value="LA">로스엔젤리스<br>
			<input type="radio" name="city1" value="SEOUL">서울<br>
			<input type="radio" name="city1" value="HONG">홍콩<br>
			<input type="radio" name="city1" value="BANG">방콕<br>
			<input type="submit" value="선택완료">
			
		
		
		</form>
		
		
</body>
</html>