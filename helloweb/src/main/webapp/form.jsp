<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- POST방식을 쓰면 URL에서 노출이 안되고 데이터가 body로 간다 -->
	<form action = "join.jsp" method = "post">
		email : <input type = "text" name = "email">
		<br/><br/>
		비밀번호 : <input type = "password" name = "password">
		<br/><br/>
		<input type = "submit" value = "회원가입">
	</form>

</body>
</html>