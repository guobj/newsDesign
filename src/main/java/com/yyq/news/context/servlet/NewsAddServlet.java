package com.yyq.news.context.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.google.gson.Gson;
import com.yyq.news.context.model.News;
import com.yyq.news.context.service.NewsService;
import com.yyq.news.utils.DateUtil;

/**
 * Servlet implementation class NewsAddServlet
 */
@WebServlet("/NewsAddServlet.do")
@MultipartConfig(
		maxFileSize=82536541,
		fileSizeThreshold=236541783
		)
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
			Part part = request.getPart("file");
			String root="D:/photo";
			File file = new File(root);
			//��ȡ�ļ���Ϣ
			String name=part.getHeader("content-disposition");
			String ext=name.substring(name.lastIndexOf("."),name.length()-1);
			String[] nameArray=name.split("\"");
			String realName=nameArray[3];
			name=UUID.randomUUID().toString().replaceAll("-", "");
			String FileName=root+"/"+name+ext;
			part.write(FileName);
			request.setAttribute("name", name+ext);
			request.setAttribute("realname", realName);
			
			String img = name+ext;
			
			String fk_nt_id = request.getParameter("type");
			String auth = request.getParameter("auth");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			News news = new News();
			news.setFk_nt_id(fk_nt_id);
			news.setAuth(auth);
			news.setTitle(title);
			news.setCreat_time(DateUtil.getInstance().creatDateTime());
			news.setUpdate_time(DateUtil.getInstance().creatDateTime());
			news.setImg(img);
			news.setContent(content);
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
