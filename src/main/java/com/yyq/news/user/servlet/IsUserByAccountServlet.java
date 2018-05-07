package com.yyq.news.user.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yyq.news.user.service.UserService;
import com.yyq.news.utils.JsonUtil;

/**
 * Servlet implementation class IsUserByAccountServlet
 */
@WebServlet("/IsUserByAccountServlet.so")
public class IsUserByAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	UserService userService = UserService.getInstance();
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String account = request.getParameter("username");
			
			Map<String, Object> map = userService.queryUserByAccount(account);
			
			JsonUtil.getInstance().toJson(response, map);
			
		} catch (Exception e) {
			JsonUtil.getInstance().toJson(response, e.getMessage());
		}
	}

}
