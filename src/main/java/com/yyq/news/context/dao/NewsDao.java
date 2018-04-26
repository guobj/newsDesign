package com.yyq.news.context.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.yyq.news.context.model.News;
import com.yyq.news.utils.JdbcUtils;
import com.yyq.news.utils.PageUtil;

public class NewsDao {
	
	//单例模式
	private static NewsDao nd = null;
	private NewsDao() {}
	public static NewsDao getInstance(){
		if(nd == null){
			synchronized(NewsDao.class){
				if(nd == null){
					nd = new NewsDao();
				}
			}
		}
		return nd;
	}
	
	//取到JDBC实例
	JdbcUtils jd = JdbcUtils.getInstance();
	
	//查询所有新闻信息
	public List<Map<String, Object>> newsList(int pages,HttpServletRequest request){
		
		StringBuilder sqls = new StringBuilder("select * from news n left join news_type nt on n.fk_nt_id=nt.nt_id where n.dr=1 and nt.nt_dr=1");
		
		if(request.getParameter("title")!=null&&request.getParameter("title").trim()!=""){
			sqls=sqls.append(" and title like '%"+request.getParameter("title").trim()+"%'");
			request.setAttribute("title", request.getParameter("title"));
		}
		if(request.getParameter("nt_name")!=null&&request.getParameter("nt_name").trim()!=""){
			sqls=sqls.append(" and nt.nt_name like '%"+request.getParameter("nt_name").trim()+"%'");
			request.setAttribute("nt_name", request.getParameter("nt_name"));
		}
		
		String sql = sqls.toString();
		@SuppressWarnings("static-access")
		List<Map<String, Object>> list = PageUtil.getInstance().ListForPage(sql, jd, request, pages);
		return list;
		
	}
	
	//添加新闻
	public int newsAdd(News news){
		
		String sql = "insert into news(title,fk_nt_id,auth,dr,content,img,creat_time,update_time) value(?,?,?,?,?,?,?,?)";
		
		Integer res = jd.updateData(sql, new Object[]{news.getTitle(),news.getFk_nt_id(),
				news.getAuth(),news.getDr(),news.getContent(),
				news.getImg(),news.getCreat_time(),news.getUpdate_time()});
		
		return res; 
		
	}
	
	//查询一条记录
	public Map<String, Object> queryOne(Integer id){
		
		String sql = "select * from news where n_id = ?";
		
		Map<String, Object> map = jd.queryOne(sql, new Object[]{id});
		
		return map;
	}
	
	//编辑新闻
	public int newsUpdate(News news){
		
		String sql = "update news set title=?,fk_nt_id=?,auth=?,update_time=? where n_id=?";
		
		Integer res = jd.updateData(sql, new Object[]{news.getTitle(),news.getFk_nt_id(),news.getAuth(),news.getUpdate_time(),news.getN_id()});
		
		return res;
	}
	
	//删除新闻-逻辑删除-即更新dr字段
	public int newsDel(Integer id){
		
		String sql = "update news set dr = false where n_id = "+id;
		
		Integer res = jd.updateData(sql, null);
		
		return res;
	}
}
