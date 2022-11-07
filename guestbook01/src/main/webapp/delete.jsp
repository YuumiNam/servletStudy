<%@page import="com.bitacademy.guestbook.vo.GuestbookVo"%>
<%@page import="com.bitacademy.guestbook.dao.GuestbookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	GuestbookVo vo = new GuestbookVo();	

	request.setCharacterEncoding("utf-8");
	String psw = request.getParameter("password");
	
	new GuestbookDao().deleteByPassword(psw);
	
	response.sendRedirect("/guestbook01");
%>