package com.yyq.news.context.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yyq.news.context.service.NewsTypeService;
import com.yyq.news.utils.JsonUtil;

/**
 * Servlet implementation class NewsTypeAddServlet
 */
@WebServlet("/NewsTypeAddServlet.do")
public class NewsTypeAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	NewsTypeService newsTypeService = NewsTypeService.getInstance();
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
			String nt_name = request.getParameter("nt_name");
			
			Integer res = newsTypeService.newsTypeAdd(nt_name);
			
			JsonUtil.getInstance().toJson(response, res);
		} catch (Exception e) {
			JsonUtil.getInstance().toJson(response, e.getMessage());
		}
	}

}
