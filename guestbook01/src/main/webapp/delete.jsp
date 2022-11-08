<%@page import="com.bitacademy.guestbook.dao.GuestbookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");

	String no = request.getParameter("no");
	String psw = request.getParameter("password");
	
	new GuestbookDao().deleteByPassword(no, psw);
	
	response.sendRedirect("/guestbook01");
%>