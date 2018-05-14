package com.yyq.news.forward.newspublish;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yyq.news.context.model.News;
import com.yyq.news.context.service.NewsService;
import com.yyq.news.utils.DateUtil;
import com.yyq.news.utils.FileUtils;
import com.yyq.news.utils.JsonUtil;

/**
 * Servlet implementation class ForwardNewsAddServlet
 */
@WebServlet("/ForwardNewsAddServlet.so")
@MultipartConfig(
		maxFileSize=82536541,
		fileSizeThreshold=236541783
		)
public class ForwardNewsAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	NewsService newsService = NewsService.getInstance();
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			HttpSession session = request.getSession();
			
			String img = FileUtils.getInstance().generateFileName(request);
			
			Integer sign = Integer.parseInt(request.getParameter("sign"));
			Integer auth = 0;
			if(sign.equals(0) || sign == 0){
				@SuppressWarnings("unchecked")
				Map<String, Object> map = (Map<String, Object>)session.getAttribute("map");
				auth = Integer.parseInt(map.get("e_id").toString());;
			}else{
				@SuppressWarnings("unchecked")
				Map<String, Object> map = (Map<String, Object>)session.getAttribute("umap");
				auth = Integer.parseInt(map.get("u_id").toString());
			}
			String fk_nt_id = request.getParameter("type");
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
			news.setSign(sign);
			
			Integer res = newsService.newsAdd(news);
			
			JsonUtil.getInstance().toJson(response, res);
			System.out.println(res);
			
		} catch (Exception e) {
			request.setAttribute("message", e.getMessage());
			System.out.println(e.getMessage());
			JsonUtil.getInstance().toJson(response, e.getMessage());
		}
	}

}
