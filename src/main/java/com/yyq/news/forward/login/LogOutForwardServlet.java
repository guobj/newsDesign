package com.yyq.news.forward.login;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LogOutForwardServlet
 */
@WebServlet("/LogOutForwardServlet.so")
public class LogOutForwardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		session.removeAttribute("umap");
		
		request.getRequestDispatcher("MainForwardServlet.so").forward(request, response);
	}

}
