<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
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
		
		생년 : <select name = "birthYear">
					<option value = "1996">1996년</option>
					<option value = "1997">1997년</option>
					<option value = "1998">1998년</option>
					<option value = "1999">1999년</option>
				</select>
		<br/><br/>
		
		성별 : 남자 <input type = "radio" name = "gender" value = "male" checked = "checked">
			  여자 <input type = "radio" name = "gender" value = "female">
		<br/><br/>
		
		자기소개 : <textarea name = "profile"> </textarea> <!-- textarea는 한칸 띄어줘야한다 -->
		<br/><br/>
		
		취미 : <br/>
		코딩<input type = "checkbox" name = "hobby" value = "coding">
		게임<input type = "checkbox" name = "hobby" value = "game">
		영화보기<input type = "checkbox" name = "hobby" value = "movie">
		독서<input type = "checkbox" name = "hobby" value = "book">
		<br/><br/>
		
		<input type = "submit" value = "회원가입">
	</form>
</body>
</html>