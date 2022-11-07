<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- GET방식으로 생성한 파라미터값 받기 -->
<%
	String name = request.getParameter("name"); 
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Hello <%=name %></h1>
	<img src='nature.jpg'/>
</body>
</html>