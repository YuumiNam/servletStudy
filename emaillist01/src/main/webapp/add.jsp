<%@page import="com.bitacademy.emaillist.dao.EmaillistDao"%>
<%@page import="com.bitacademy.emaillist.vo.EmaillistVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
<%
 request.setCharacterEncoding("utf-8");
 	String firstName = request.getParameter("fn");
 	String lastName = request.getParameter("ln");
 	String email = request.getParameter("email");
 	
 	EmaillistVo vo = new EmaillistVo();
 	
 	vo.setFirstName(firstName);
 	vo.setLastName(lastName);
 	vo.setEmail(email);
 	
 	new EmaillistDao().insert(vo);
 	
 	response.sendRedirect("/emaillist01");
 %>  

<!-- reponse를 앞 리스트로 Redirect해야되고 그것으로 끝내야함 안그러고 add에 머물러있으면 새로고침 할때마다 DB에 계속 추가됨 -->