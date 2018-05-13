package com.yyq.news.employee.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yyq.news.employee.model.Employee;
import com.yyq.news.employee.service.EmployeeService;
import com.yyq.news.utils.DateUtil;
import com.yyq.news.utils.JsonUtil;

/**
 * Servlet implementation class EmployeeAddServlet
 */
@WebServlet("/EmployeeAddServlet.do")
public class EmployeeAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	EmployeeService employeeService = EmployeeService.getInstance();
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

try {
			
			String e_name = request.getParameter("e_name");
			Integer e_sex = Integer.parseInt(request.getParameter("e_sex"));
			Integer fk_p_id = Integer.parseInt(request.getParameter("fk_p_id"));
			Integer e_age = Integer.parseInt(request.getParameter("e_age"));
			String e_address = request.getParameter("e_address");
			String e_tel = request.getParameter("e_tel");
			String e_email = request.getParameter("e_email");
			String account = request.getParameter("account");
			
			Employee employee = new Employee();
			employee.setE_address(e_address);
			employee.setE_age(e_age);
			employee.setE_name(e_name);
			employee.setE_email(e_email);
			employee.setE_sex(e_sex);
			employee.setE_tel(e_tel);
			employee.setE_sex(e_sex);
			employee.setFk_p_id(fk_p_id);
			employee.setAccount(account);
			employee.setE_creat_time(DateUtil.getInstance().creatDateTime());
			
			Integer res = employeeService.employeeAdd(employee);
			
			JsonUtil.getInstance().toJson(response, res);
			
		} catch (Exception e) {
			JsonUtil.getInstance().toJson(response, e.getMessage());
		}
	}

}
