package com.yyq.news.context.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yyq.news.context.model.NewsType;
import com.yyq.news.context.service.NewsTypeService;
import com.yyq.news.utils.JsonUtil;

/**
 * Servlet implementation class NewsTypeUpdateServlet
 */
@WebServlet("/NewsTypeUpdateServlet.do")
public class NewsTypeUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	NewsTypeService newsTypeService = NewsTypeService.getInstance();
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		try {
			String nt_name = request.getParameter("nt_name");
			
			Integer nt_id = Integer.parseInt(request.getParameter("id"));
			
			NewsType newsType = new NewsType();
			newsType.setNt_name(nt_name);
			newsType.setNt_id(nt_id);
			
			Integer res = newsTypeService.newsTypeUpdate(newsType);
			
			JsonUtil.getInstance().toJson(response, res);
		} catch (Exception e) {
			// TODO: handle exception
			JsonUtil.getInstance().toJson(response, e.getMessage());
		}
	}

}
