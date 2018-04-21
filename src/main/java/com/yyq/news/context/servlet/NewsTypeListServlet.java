package com.yyq.news.context.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yyq.news.context.service.NewsTypeService;
import com.yyq.news.utils.JsonUtil;

/**
 * Servlet implementation class NewsTypeListServlet
 */
@WebServlet("/NewsTypeListServlet.do")
public class NewsTypeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	NewsTypeService newsTypeService = NewsTypeService.getInstance();
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		try {
			List<Map<String, Object>> list = newsTypeService.queryForList();

			request.setAttribute("list", list);
			
			request.getRequestDispatcher("WEB-INF/back/newsContent/newsTypeList.jsp").forward(request, response);
		} catch (Exception e) {
			request.setAttribute("message", e.getMessage());
		}
	}

}
