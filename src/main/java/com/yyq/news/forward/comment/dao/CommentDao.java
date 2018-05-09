package com.yyq.news.forward.comment.dao;

import java.util.List;
import java.util.Map;

import com.yyq.news.forward.comment.model.Comment;
import com.yyq.news.utils.JdbcUtils;

public class CommentDao {

	//单例模式
	private static CommentDao cd = null;
	private CommentDao() {}
	public static CommentDao getInstance(){
		if(cd == null){
			synchronized(CommentDao.class){
				if(cd == null){
					cd = new CommentDao();
				}
			}
		}
		return cd;
	}
	
	JdbcUtils jd = JdbcUtils.getInstance();
	
	//新闻评论
	public Integer newsComment(Comment comment){
		
		String sql = "insert into comment(fk_u_id,fk_n_id,create_time,comment) values(?,?,?,?)";
		
		Integer res = jd.updateData(sql, new Object[]{comment.getFk_u_id(),comment.getFk_n_id(),comment.getCreate_time(),comment.getComment()});
		
		return res;
	}
	
	//查询对应新闻下的评论
	public List<Map<String, Object>> commentList(Integer fk_n_id){
		
		String sql = "select * from comment c left join user u on c.fk_u_id = u.u_id where c.fk_n_id = "+fk_n_id;
		
		List<Map<String, Object>> list = jd.query(sql, null);
		
		return list;
	}
}
