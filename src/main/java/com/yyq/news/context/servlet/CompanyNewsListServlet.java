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
			//首页
			int pages=1;
			
			//接受前端传来的页数（第几页）
			if(request.getParameter("pages") != null && request.getParameter("pages") != ""){
				//将string转换为integer
				pages=Integer.parseInt(request.getParameter("pages"));
				//已key-values形式存储到request里，返回给前端（key：pages，value：pages的值）
				request.setAttribute("pages", pages);
			}
			//调用service层方法
			List<Map<String, Object>> list = newsService.companyNewsList(pages, request);
			
			//已key-values形式存储到request里，返回给前端（key：newsList，value：list的值）
			request.setAttribute("newsList", list);
			
			//已key-values形式存储到request里，返回给前端（url，value：CompanyNewsListServlet.do）
			//此url为前端翻页时跳转的路径
			request.setAttribute("url", "CompanyNewsListServlet.do");
		} catch (Exception e) {
			//异常处理
			request.setAttribute("message", e.getMessage());
		}
		
		//请求转发，携带request的值到相应页面，前后页面共享一个request，只要中间页面不展示request一直存在
		request.getRequestDispatcher("WEB-INF/back/newsContent/company_newsList.jsp").forward(request, response);
	}

}
