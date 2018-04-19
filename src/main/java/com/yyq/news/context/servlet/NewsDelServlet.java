package com.yyq.news.context.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yyq.news.context.service.NewsService;
import com.yyq.news.utils.JsonUtil;

/**
 * Servlet implementation class NewsDelServlet
 */
@WebServlet("/NewsDelServlet.do")
public class NewsDelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	NewsService newsService = NewsService.getInstance();
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		try {
			Integer id = Integer.parseInt(request.getParameter("id"));
			
			Integer res = newsService.newsDel(id);
			
			JsonUtil.getInstance().toJson(response, res);
		} catch (Exception e) {
			JsonUtil.getInstance().toJson(response, e.getMessage());
		}
	}

}
