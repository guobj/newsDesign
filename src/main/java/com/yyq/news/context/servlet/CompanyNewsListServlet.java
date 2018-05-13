package com.yyq.news.context.servlet;

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
 * Servlet implementation class CompanyNewsListServlet
 */
@WebServlet("/CompanyNewsListServlet.do")
public class CompanyNewsListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	NewsService newsService = NewsService.getInstance();
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			int pages=1;
			if(request.getParameter("pages")!=null&&request.getParameter("pages")!=""){
				pages=Integer.parseInt(request.getParameter("pages"));
				request.setAttribute("pages", pages);
			}
			List<Map<String, Object>> list = newsService.companyNewsList(pages, request);
			request.setAttribute("newsList", list);
			request.setAttribute("url", "CompanyNewsListServlet.do");
		} catch (Exception e) {
			request.setAttribute("message", e.getMessage());
		}
		
		request.getRequestDispatcher("WEB-INF/back/newsContent/company_newsList.jsp").forward(request, response);
	}

}
