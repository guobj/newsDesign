package com.yyq.news.forward.article;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yyq.news.context.service.NewsService;

/**
 * Servlet implementation class ArticleSearchServlet
 */
@WebServlet("/ArticleSearchServlet.so")
public class ArticleSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	NewsService newsService = NewsService.getInstance();
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String title = request.getParameter("title");
			
			Map<String, Object> map = newsService.queryByTitle(title);
			
			request.setAttribute("map", map);
//			request.getRequestDispatcher("WEB-INF/forward/article/article_type.jsp");
		} catch (Exception e) {
			// TODO: handle exception
			request.setAttribute("message", e.getMessage());
		}
		request.getRequestDispatcher("WEB-INF/forward/article/article_type.jsp").forward(request, response);
	}

}
