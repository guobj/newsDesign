package com.yyq.news.user.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yyq.news.user.model.User;
import com.yyq.news.user.service.UserService;
import com.yyq.news.utils.JsonUtil;

/**
 * Servlet implementation class UserRegisterServlet
 */
@WebServlet("/UserRegisterServlet.so")
public class UserRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	UserService userService = UserService.getInstance();
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
			String account = request.getParameter("username");
			
			String password = request.getParameter("passward");
			
			String u_name = request.getParameter("u_name");
			
			User user = new User();
			user.setAccount(account);
			user.setPassword(password);
			user.setU_name(u_name);
			
			Integer res = userService.register(user);
			
			JsonUtil.getInstance().toJson(response, res);
		} catch (Exception e) {
			JsonUtil.getInstance().toJson(response, e.getMessage());
		}
	}

}
