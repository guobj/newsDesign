package com.yyq.news.context.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.google.gson.Gson;
import com.yyq.news.context.service.NewsTypeService;

/**
 * Servlet implementation class NewsTypeServlet
 */
@WebServlet("/NewsTypeServlet.do")
public class NewsTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	NewsTypeService newsTypeService = NewsTypeService.getInstance();
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		try {
			List<Map<String, Object>> list = newsTypeService.queryForList();
			Gson gson = new Gson();
			String data = gson.toJson(list);
			
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print(data);
			out.flush();
			out.close();
			
		} catch (Exception e) {
		}
		
	}

}
