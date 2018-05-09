package com.yyq.news.forward.member;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yyq.news.user.service.UserService;

/**
 * Servlet implementation class MemberServlet
 */
@WebServlet("/MemberServlet.so")
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	UserService userService = UserService.getInstance();
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Integer id = Integer.parseInt(request.getParameter("id"));
			
			Map<String, Object> map = userService.queryUserInfoById(id);
			
			request.setAttribute("map", map);
			
			request.getRequestDispatcher("WEB-INF/forward/member/member.jsp").forward(request, response);
		} catch (Exception e) {
			request.setAttribute("message", e.getMessage());
			request.getRequestDispatcher("WEB-INF/forward/member/member.jsp").forward(request, response);
		}
	}

}
