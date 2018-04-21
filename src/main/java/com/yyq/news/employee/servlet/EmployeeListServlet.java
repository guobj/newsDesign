package com.yyq.news.employee.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yyq.news.employee.service.EmployeeService;

/**
 * Servlet implementation class EmployeeListServlet
 */
@WebServlet("/EmployeeListServlet.do")
public class EmployeeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	EmployeeService employeeService = EmployeeService.getInstance();
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
			int pages=1;
			if(request.getParameter("pages")!=null&&request.getParameter("pages")!=""){
				pages=Integer.parseInt(request.getParameter("pages"));
				request.setAttribute("pages", pages);
			}
			List<Map<String, Object>> list = employeeService.queryListForPage(pages, request);
			request.setAttribute("list", list);
			request.setAttribute("url", "EmployeeListServlet.do");
		} catch (Exception e) {
			request.setAttribute("message", e.getMessage());
		}
		
		request.getRequestDispatcher("WEB-INF/back/employee/employeeList.jsp").forward(request, response);
	}

}
