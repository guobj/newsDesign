package com.yyq.news.employee.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yyq.news.employee.service.EmployeeService;

/**
 * Servlet implementation class EmployeeAddServlet
 */
@WebServlet("/EmployeeAddServlet.do")
public class EmployeeAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	EmployeeService employeeService = EmployeeService.getInstance();
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
			
//			employeeService
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
