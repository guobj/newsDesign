package com.yyq.news.forward.main;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yyq.news.context.service.NewsService;
import com.yyq.news.utils.JsonUtil;

/**
 * Servlet implementation class ArticleListServlet
 */
@WebServlet("/ArticleListServlet.so")
public class ArticleListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	NewsService newsService = NewsService.getInstance();
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
			
			List<Map<String, Object>> list = newsService.queryAll();
			
			JsonUtil.getInstance().toJson(response, list);
		} catch (Exception e) {
			request.setAttribute("message", e.getMessage());
		}
	}

}
