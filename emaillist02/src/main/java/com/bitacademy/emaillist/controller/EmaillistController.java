package com.bitacademy.emaillist.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitacademy.emaillist.dao.EmaillistDao;
import com.bitacademy.emaillist.vo.EmaillistVo;


public class EmaillistController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String action = request.getParameter("a"); // 파라미터 값을 임의로 설정해주는 것은 get방식으로써 나중에 url에 써줘야함
												   // ex) http://localhost:8080/emaillist02/el?a=list
		
//		// 메인화면은 else뒤로 빼줘야함. 이용자가 URL을 잘못입력했을시에도 메인화면에 들어올수 있게끔 해줘야하기 때문
//		if("list".equals(action)) {
//			List<EmaillistVo> list = new EmaillistDao().findAll();
			
//			request.setAttribute("list", list);
		
//			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/index.jsp");
//			rd.forward(request, response);}
			
		if("form".equals(action)) {
			//jsp파일을 직접 꺼내쓰지 않고 숨겨놓음(WEB-INF에). 컨트롤러에서 꺼내오는 메소드를 만듬
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/form.jsp");
			rd.forward(request, response);
		} else if("add".equals(action)) {
			String firstName = request.getParameter("fn");
			String lastName = request.getParameter("ln");
			String email = request.getParameter("email");
			
			EmaillistVo vo = new EmaillistVo();
			
			vo.setFirstName(firstName);
			vo.setLastName(lastName);
			vo.setEmail(email);
			
			new EmaillistDao().insert(vo);
			
			response.sendRedirect("./el?a=list");
		} else {
			List<EmaillistVo> list = new EmaillistDao().findAll();
			
			request.setAttribute("list", list);
			
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/index.jsp");
			rd.forward(request, response);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
