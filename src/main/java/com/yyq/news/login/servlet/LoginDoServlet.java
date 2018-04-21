package com.yyq.news.login.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yyq.news.login.service.LoginService;

/**
 * Servlet implementation class LoginDoServlet
 */
@WebServlet("/LoginDoServlet.do")
public class LoginDoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	LoginService loginService = LoginService.getInstance();
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			
			String account = request.getParameter("account");
			String password = request.getParameter("password");
			
			Map<String, Object> map = loginService.login(account, password);
			
			request.setAttribute("map", map);
			
			request.getRequestDispatcher("WEB-INF/back/main/main.jsp").forward(request, response);
		} catch (Exception e) {
			request.setAttribute("message", e.getMessage());
			request.getRequestDispatcher("WEB-INF/back/login/login.jsp").forward(request, response);
		}
	}

}
