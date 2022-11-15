<%@page import="com.bitacademy.guestbook.dao.GuestbookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%

	request.setCharacterEncoding("utf-8");

	String sno = request.getParameter("no");
	Long no = Long.parseLong(sno);
	String psw = request.getParameter("password");
	
	new GuestbookDao().deleteByNoAndPassword(no, psw);
	
	response.sendRedirect("/guestbook01");
%>