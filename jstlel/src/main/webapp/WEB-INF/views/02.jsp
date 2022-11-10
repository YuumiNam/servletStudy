<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<h4>scope(객체의 저장 범위)</h4>
	${vo.no } <br/>
	${vo.name } <br/>
	
	================== <br/>
	
	${sessionScope.vo.no } <br/> <!-- 중복될때는 vo 앞에 scope도 지정해주자 -->
	${sessionScope.vo.name } <br/>
</body>
</html>