package com.yyq.news.context.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.yyq.news.context.model.News;
import com.yyq.news.context.service.NewsService;
import com.yyq.news.utils.DateUtil;

/**
 * Servlet implementation class NewsAddServlet
 */
@WebServlet("/NewsAddServlet.do")
public class NewsAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	NewsService newsService = NewsService.getInstance();
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		Integer fk_nt_id = Integer.parseInt(request.getParameter("type"));
		try {
			
			String fk_nt_id = request.getParameter("type");
			String auth = request.getParameter("auth");
			String title = request.getParameter("title");
			
			News news = new News();
			news.setFk_nt_id(fk_nt_id);
			news.setAuth(auth);
			news.setTitle(title);
			news.setCreat_time(DateUtil.getInstance().creatDateTime());
			news.setUpdate_time(DateUtil.getInstance().creatDateTime());
			news.setDr(true);
			
			Integer res = newsService.newsAdd(news);
			
			Gson gson = new Gson();
			String data = gson.toJson(res);
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print(data);
			out.flush();
			out.close();
			
		} catch (Exception e) {
			request.setAttribute("message", e.getMessage());
		}
		
//		request.getRequestDispatcher("WEB-INF/back/newsContent/newsAdd.jsp").forward(request, response);
	}

}
