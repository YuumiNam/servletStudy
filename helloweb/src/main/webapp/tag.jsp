<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<h1>Hello World</h1>
	<h2>Hello World</h2>
	<h3>Hello World</h3>
	<h4>Hello World</h4>
	<h5>Hello World</h5>
	<h6>Hello World</h6>
	
	<!-- 원래 border,cellspacing같이 꾸며주는것은 CSS에서 해주는것이 바람직함 -->
	<table border = '1' cellspacing = '0'> 
		<tr>
			<th>글번호</th>
			<th>글제목</th>
			<th>작성자</th>
		</tr>
		
		<tr>
			<td>1</td>
			<td>안녕</td>
			<td>둘리</td>
		</tr>
		
		<tr>
			<td>2</td>
			<td>안녕</td>
			<td>마이콜</td>
		</tr>
	</table>
	
	<br/>
	<img src = "http://localhost:8080/helloweb/nature.jpg" style = "width:100px"> <!-- 절대경로 -->
	<br/>
	<img src = "/helloweb/nature.jpg" style = "width:100px"> <!-- (같은 프로그램 안에서의) 절대경로 -->
	<br/>
	<img src = "./nature.jpg" style = "width:100px"> <!-- 상대경로 -->
	
	<p>
		문장입니다!<br/>
		문장입니다!<br/>
		문장입니다!<br/>
	</p>
	
	<a href = "./hello.jsp?name=이선무">hello로 가기</a> <!-- GET방식으로 파라미터값 생성하기 (read의 개념)-->
	<br/>
	<a href = "./form.jsp">폼으로 가기</a> <!-- POST방식은 GET방식처럼 URL에 못씀(create의 개념)-->
</body>
</html>