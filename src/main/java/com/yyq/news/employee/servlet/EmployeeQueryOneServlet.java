package com.yyq.news.employee.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yyq.news.employee.service.EmployeeService;
import com.yyq.news.utils.JsonUtil;

/**
 * Servlet implementation class EmployeeQueryOneServlet
 */
@WebServlet("/EmployeeQueryOneServlet.do")
public class EmployeeQueryOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	EmployeeService employeeService = EmployeeService.getInstance();
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Integer id = Integer.parseInt(request.getParameter("id"));
			Map<String, Object> map = employeeService.queryOne(id);
			JsonUtil.getInstance().toJson(response, map);
		} catch (Exception e) {
			JsonUtil.getInstance().toJson(response, e.getMessage());
		}
	}

}
