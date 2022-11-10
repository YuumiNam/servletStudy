<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<h4>값 출력</h4>
	${iVal } <br/>
	${lVal } <br/>
	${fVal } <br/>
	${bVal } <br/>
	${sVal } <br/>
	
	
	<h4>객체 출력</h4>
	-${obj }- <br/> <!-- null은 출력이 안됨 -->
	${userVo.no } <br/>
	${userVo.name } <br/>
	
	
	<h4>map의 객체 출력</h4>
	${m.iVal } <br/>
	${m.lVal } <br/>
	${m.fVal } <br/>
	${m.bVal } <br/>
	${m.sVal } <br/>
	
	
	<h4>산술 연산</h4>
	${3 * 4 + 6 / 2 }
	${iVal + 10 } <br/>
	
	
	<h4>관계 연산</h4>
	${iVal == 10 } <br/>
	${iVal < 10 } <br/>
	${empty obj } <br/> <!-- 'obj == null'은 null이 자바코드이므로 쓰지말기 -->
	${not empty obj } <br/> <!-- 'obj != null'은 null이 자바코드이므로 쓰지말기 -->

	<h4>논리 연산</h4>
	${iVal == 10 && lVal < 1000} <br/>
	${iVal == 10 || lVal < 1000} <br/>
	

	<h4>요청파라미터</h4>
	${param.a } <br/> <!-- request.getParameter("a")를 대신함 --> 
	${param.email } <br/> <!-- http://localhost:8080/jstlel/01?a=10&email=dltjsam@gmail.com  -->
	
	
</body>
</html>