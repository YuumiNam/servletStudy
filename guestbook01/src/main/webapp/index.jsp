<%@page import="java.util.List"%>
<%@page import="com.bitacademy.guestbook.dao.GuestbookDao"%>
<%@page import="com.bitacademy.guestbook.vo.GuestbookVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%

	List<GuestbookVo> list = new GuestbookDao().findAll();
	int count = 1;
%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록</title>
</head>

<body>
	<form action="./add.jsp" method="post">
	<table border=1 width=500>
		<tr>
			<td>이름</td><td><input type="text" name="name"></td>
			<td>비밀번호</td><td><input type="password" name="password"></td>
		</tr>
		<tr>
			<td colspan=4><textarea name= "contents" cols=60 rows=5></textarea></td>
		</tr>
		<tr>
			<td colspan=4 align=right><input type="submit" value="제출"></td>
		</tr>
	</table>
	</form>
	<br>
	
	
	<!-- 게스트 리스트 -->
	<%
		for(GuestbookVo vo : list) {
	%>
	<table width=510 border=1>
		<tr>
			<td>[<%=count++ %>]</td>
			<td><%=vo.getName() %></td>
			<td><%=vo.getDate() %></td>
			<td><a href="./deleteform.jsp?no=<%=vo.getNo() %>">삭제</a></td> <!-- no는 여기서 get방식으로 지정했음 -->
		</tr>
		<tr>
			<td colspan=4><%=vo.getContents().replaceAll("\n", "<br>") %></td>
		</tr>
	</table>
	<%
		}
	%>
</body>
</html>