package com.yyq.news.personInfo;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yyq.news.employee.service.EmployeeService;
import com.yyq.news.utils.JsonUtil;

/**
 * Servlet implementation class PersonInfoServlet
 */
@WebServlet("/PersonInfoServlet.do")
public class PersonInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	EmployeeService employeeService = EmployeeService.getInstance();
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
			HttpSession session = request.getSession();
			
			@SuppressWarnings("unchecked")
			Map<String, Object> map = (Map<String, Object>)session.getAttribute("map");
			
			Map<String, Object> personInfo = employeeService.queryOne(Integer.parseInt(map.get("e_id").toString()));
		
			request.setAttribute("personInfo", personInfo);
			
			request.getRequestDispatcher("WEB-INF/back/employee/personInfo.jsp").forward(request, response);
		} catch (Exception e) {
			
		}
	}

}
