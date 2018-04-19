package com.yyq.news.context.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yyq.news.context.service.NewsService;
import com.yyq.news.utils.JsonUtil;

@WebServlet("/NewsQueryOneServlet.do")
public class NewsQueryOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	NewsService newsService = NewsService.getInstance();
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		Integer id = Integer.parseInt(request.getParameter("id"));
		
		Map<String, Object> map = newsService.queryOne(id);
		
		JsonUtil.getInstance().toJson(response, map);
		
	}

}
