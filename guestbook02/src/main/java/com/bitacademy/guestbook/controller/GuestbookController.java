package com.bitacademy.guestbook.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitacademy.guestbook.dao.GuestbookDao;
import com.bitacademy.guestbook.vo.GuestbookVo;


public class GuestbookController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String action = request.getParameter("a"); // 파라미터 값을 임의로 설정해주는 것은 get방식으로써 나중에 url에 써줘야함
												   // ex) http://localhost:8080/guestbook02/gb?a=list
		
//		// 메인화면은 else뒤로 빼줘야함. 이용자가 URL을 잘못입력했을시에도 메인화면에 들어올수 있게끔 해줘야하기 때문
//		if("list".equals(action)) {
//			List<GuestbookVo> list = new GuestbookDao().findAll();
//			
//			request.setAttribute("list", list);
//			
//			RequestDispatcher rd = request.getRequestDispatcher("./WEB-INF/views/index.jsp");
//			rd.forward(request, response);} 
		if("add".equals(action)) {
			String name = request.getParameter("name");
			String password = request.getParameter("password");
			String contents = request.getParameter("contents");
			
			 GuestbookVo vo= new GuestbookVo();
			 vo.setName(name);
			 vo.setPassword(password);
			 vo.setContents(contents);
			 
			 new GuestbookDao().insert(vo);
			 
			 response.sendRedirect("./gb");
		} else if("deleteform".equals(action)) {
			//jsp파일을 직접 꺼내쓰지 않고 숨겨놓음(WEB-INF에). 컨트롤러에서 꺼내오는 메소드를 만듬
			RequestDispatcher rd = request.getRequestDispatcher("./WEB-INF/views/deleteform.jsp");
			rd.forward(request, response);
		} else if("delete".equals(action)) {
			String sno = request.getParameter("no");
			Long no = Long.parseLong(sno);
			String psw = request.getParameter("password");
			
			new GuestbookDao().deleteByNoAndPassword(no, psw);
			
			response.sendRedirect("./gb");
		} else {
			List<GuestbookVo> list = new GuestbookDao().findAll();
			
			request.setAttribute("list", list);
			
			RequestDispatcher rd = request.getRequestDispatcher("./WEB-INF/views/index.jsp");
			rd.forward(request, response);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}
}
