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
 * Servlet implementation class ArticleTypeServlet
 */
@WebServlet("/ArticleTypeServlet.so")
public class ArticleTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	NewsService newsService = NewsService.getInstance();
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			Integer nt_id = Integer.parseInt( request.getParameter("id"));
			List<Map<String, Object>> list = newsService.queryByType(nt_id);
			request.setAttribute("list", list);
			request.getRequestDispatcher("WEB-INF/forward/article/article_type.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}

}
