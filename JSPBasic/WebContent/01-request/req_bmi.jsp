<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bmi지수 구하기</title>
</head>
<body>
	<%--
		사용자의 키(height)와 체중(weight)를 입력받아 BMI지수를 계산해 출력하는 form 및 출력 페이지
		
		1. 사용자의 입력값을 서버로 전송할 때 form사용
		2. form의 action=속성을 이용해 전달할 페이지 URL 지정
		3. input 태그에 name이라는 속성으로 요청자료를 부를 명칭 정하기
		4. req_bmi.jsp => req_bmi_result.jsp
	 --%>
	 <form action="req_bmi_result.jsp" method="post">
	 	신장   : <input type="text" name="height" size="10px">cm<br/>
	 	체중 : <input type="text" name="weight" size="10px">kg<br/>
		<input type="submit" value="입력완료">&nbsp; 
		<input type="reset" value="다시작성">
	 </form>
	 
</body>
</html>