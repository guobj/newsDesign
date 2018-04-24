package com.yyq.news.employee.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yyq.news.employee.service.EmployeeService;
import com.yyq.news.utils.JsonUtil;

/**
 * Servlet implementation class EmployeeDelServlet
 */
@WebServlet("/EmployeeDelServlet.do")
public class EmployeeDelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	EmployeeService employeeService = EmployeeService.getInstance();
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
			Integer id = Integer.parseInt(request.getParameter("id"));
			
			Integer res = employeeService.employeeDel(id);
			
			JsonUtil.getInstance().toJson(response, res);
		} catch (Exception e) {
			JsonUtil.getInstance().toJson(response, e.getMessage());
		}
	}

}
