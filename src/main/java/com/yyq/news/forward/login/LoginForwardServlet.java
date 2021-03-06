package com.yyq.news.forward.login;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yyq.news.login.service.LoginService;
import com.yyq.news.utils.JsonUtil;

/**
 * Servlet implementation class LoginForwardServlet
 */
@WebServlet("/LoginForwardServlet.so")
public class LoginForwardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	LoginService loginService = LoginService.getInstance();

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {

			String account = request.getParameter("account");
			String password = request.getParameter("password");

			Map<String, Object> map = loginService.loginForward(account, password);

			HttpSession session = request.getSession();
			session.setAttribute("umap", map);
			request.setAttribute("umap", map);

//			request.getRequestDispatcher("MainForwardServlet.so").forward(request,response);
			JsonUtil.getInstance().toJson(response, map);
		} catch (Exception e) {
			request.setAttribute("message", e.getMessage());
			JsonUtil.getInstance().toJson(response, e.getMessage());
			// request.getRequestDispatcher("LoginServlet.do").forward(request,
			// response);
		}
	}

}
