package com.yyq.news.context.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yyq.news.context.model.News;
import com.yyq.news.context.service.NewsService;
import com.yyq.news.utils.DateUtil;
import com.yyq.news.utils.FileUtils;
import com.yyq.news.utils.JsonUtil;

/**
 * Servlet implementation class NewsUpdateServlet
 */
@WebServlet("/NewsUpdateServlet.do")
@MultipartConfig(
		maxFileSize=82536541,
		fileSizeThreshold=236541783
		)
public class NewsUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	NewsService newsService = NewsService.getInstance();
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			String content = request.getParameter("content");
			String fk_nt_id = request.getParameter("type");
			Integer n_id = Integer.parseInt(request.getParameter("id")); 
			String title = request.getParameter("title");
			
			News news = new News();
			news.setN_id(n_id);
			news.setFk_nt_id(fk_nt_id);
			news.setTitle(title);
			news.setUpdate_time(DateUtil.getInstance().creatDateTime());
			news.setContent(content);
			
			Integer res = newsService.newsUpdate(news);
			
			//转为Json
			JsonUtil.getInstance().toJson(response, res);
		} catch (Exception e) {
			JsonUtil.getInstance().toJson(response, e.getMessage());
		}
		
	}

}
