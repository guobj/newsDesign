package com.yyq.news.context.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yyq.news.context.service.NewsTypeService;
import com.yyq.news.utils.JsonUtil;

/**
 * Servlet implementation class NewsTypeQueryOneServlet
 */
@WebServlet("/NewsTypeQueryOneServlet.do")
public class NewsTypeQueryOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	NewsTypeService newsTypeService = NewsTypeService.getInstance();
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			Integer id = Integer.parseInt(request.getParameter("id"));
			Map<String, Object> map = newsTypeService.queryOne(id);
			JsonUtil.getInstance().toJson(response, map);
		} catch (Exception e) {
			JsonUtil.getInstance().toJson(response, e.getMessage());
		}
		
	}

}
