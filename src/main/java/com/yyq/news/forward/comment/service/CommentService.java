package com.yyq.news.forward.comment.service;

import java.util.List;
import java.util.Map;

import com.yyq.news.forward.comment.dao.CommentDao;
import com.yyq.news.forward.comment.model.Comment;

public class CommentService {

	//单例模式
	private static CommentService commentService = null;
	private CommentService() {}
	public static CommentService getInstance(){
		if(commentService == null){
			synchronized(CommentService.class){
				if(commentService == null){
					commentService = new CommentService();
				}
			}
		}
		return commentService;
	}
	
	CommentDao dao = CommentDao.getInstance();
	
	//新闻评论
	public Integer newsComment(Comment comment){
		
		Integer res = dao.newsComment(comment);
		
		if(res <= 0){
			throw new RuntimeException("评论失败");
		}
		
		return res;
	}
	
	//查询对应新闻下的评论
	public List<Map<String, Object>> commentList(Integer fk_n_id){
		
		List<Map<String, Object>> list = dao.commentList(fk_n_id);
		
		if(list == null || list.size() <= 0){
			throw new RuntimeException("暂无评论");
		}
		
		return list;
	}
}
