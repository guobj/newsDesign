package com.yyq.news.forward.comment.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yyq.news.forward.comment.service.CommentService;

/**
 * Servlet implementation class CommentListServlet
 */
@WebServlet("/CommentListServlet.so")
public class CommentListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	CommentService commentService = CommentService.getInstance();
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			Integer fk_n_id = Integer.parseInt(request.getParameter("fk_n_id"));
			
			List<Map<String, Object>> list = commentService.commentList(fk_n_id);
			
			request.setAttribute("list", list);
			
		} catch (Exception e) {
			request.setAttribute("message", e.getMessage());
		}
		request.getRequestDispatcher("WEB-INF/forward/article/article.jsp").forward(request, response);
	}

}
