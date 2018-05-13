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

@WebServlet("/MainForwardServlet.so")
public class MainForwardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	NewsService newsService = NewsService.getInstance();
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			Map<String, Object> map = newsService.queryAll();
			
			request.setAttribute("map", map);
			
			request.getRequestDispatcher("WEB-INF/forward/main/main.jsp").forward(request, response);
//			request.getRequestDispatcher("WEB-INF/forward/article/news_publish.jsp").forward(request, response);
		} catch (Exception e) {
			request.setAttribute("message", e.getMessage());
		}
	}

}
