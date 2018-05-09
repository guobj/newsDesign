package com.yyq.news.forward.comment.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yyq.news.forward.comment.model.Comment;
import com.yyq.news.forward.comment.service.CommentService;
import com.yyq.news.utils.DateUtil;
import com.yyq.news.utils.JsonUtil;

/**
 * Servlet implementation class CommentAddServlet
 */
@WebServlet("/CommentAddServlet.so")
public class CommentAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	CommentService commentService = CommentService.getInstance();
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
			Integer fk_n_id = Integer.parseInt(request.getParameter("fk_n_id"));
			
			Integer fk_u_id = Integer.parseInt(request.getParameter("fk_u_id"));
			
			String create_time = DateUtil.getInstance().creatDateTime();
			
			String content = request.getParameter("comment");
			
			Comment comment = new Comment();
			comment.setFk_n_id(fk_n_id);
			comment.setFk_u_id(fk_u_id);
			comment.setCreate_time(create_time);
			comment.setComment(content);
			
			Integer res = commentService.newsComment(comment);
			JsonUtil.getInstance().toJson(response, res);
		} catch (Exception e) {
			// TODO: handle exception
			JsonUtil.getInstance().toJson(response, e.getMessage());
		}
	}

}
