package com.yyq.news.forward.article;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yyq.news.context.service.NewsService;
import com.yyq.news.utils.JsonUtil;

/**
 * Servlet implementation class LatestArticleServlet
 */
@WebServlet("/LatestArticleServlet.so")
public class LatestArticleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	NewsService newsService = NewsService.getInstance();
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Integer auth = Integer.parseInt(request.getParameter("auth"));
		
		Integer sign = Integer.parseInt(request.getParameter("sign"));
		
		Map<String, Object> latestMap = newsService.queryLatestbyUserID(auth, sign);
				
		JsonUtil.getInstance().toJson(response, latestMap);
	}

}
