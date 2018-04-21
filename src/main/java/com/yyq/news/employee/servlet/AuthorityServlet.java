package com.yyq.news.employee.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yyq.news.employee.service.AuthorityService;
import com.yyq.news.utils.JsonUtil;

/**
 * Servlet implementation class AuthorityServlet
 */
@WebServlet("/AuthorityServlet.do")
public class AuthorityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	AuthorityService authorityService = AuthorityService.getInstance();
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			List<Map<String, Object>> list = authorityService.queryList();
			JsonUtil.getInstance().toJson(response, list);
		} catch (Exception e) {
			JsonUtil.getInstance().toJson(response, e.getMessage());
		}
	}

}
