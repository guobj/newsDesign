package com.yyq.news.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yyq.news.user.model.User;
import com.yyq.news.user.service.UserService;
import com.yyq.news.utils.DateUtil;

/**
 * Servlet implementation class UserUpdateServlet
 */
@WebServlet("/UserUpdateServlet.so")
public class UserUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	UserService userService = UserService.getInstance();
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		try {
			Integer id = Integer.parseInt(request.getParameter("id"));
			String u_email = request.getParameter("u_email");
			String u_tel = request.getParameter("u_tel");
			String u_address = request.getParameter("u_address");
			String u_realname = request.getParameter("u_realname");
			String u_profession = request.getParameter("u_profession");
			String u_blog = request.getParameter("u_blog");
			
			User user = new User();
			user.setU_email(u_email);
			user.setU_tel(u_tel);
			user.setU_address(u_address);
			user.setU_realname(u_realname);
			user.setU_profession(u_profession);
			user.setU_blog(u_blog);
			user.setU_id(id);
			user.setU_create_time(DateUtil.getInstance().creatDateTime());
			
			Integer res = userService.userUpdate(user);
			request.getRequestDispatcher("MemberServlet.so").forward(request, response);
		} catch (Exception e) {
			request.setAttribute("message", e.getMessage());
		}
	}

}
