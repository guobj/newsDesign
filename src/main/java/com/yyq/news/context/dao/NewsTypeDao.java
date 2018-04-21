package com.yyq.news.context.dao;

import java.util.List;
import java.util.Map;

import com.yyq.news.context.model.NewsType;
import com.yyq.news.utils.JdbcUtils;

public class NewsTypeDao {

	//单例模式
		private static NewsTypeDao nd = null;
		private NewsTypeDao() {}
		public static NewsTypeDao getInstance(){
			if(nd == null){
				synchronized(NewsTypeDao.class){
					if(nd == null){
						nd = new NewsTypeDao();
					}
				}
			}
			return nd;
		}
		
		JdbcUtils jd = JdbcUtils.getInstance();
		
		//查询分类列表
		public List<Map<String, Object>> queryForList(){
			
			String sql = "select * from news_type where nt_dr = 1";
			
			List<Map<String, Object>> list = jd.query(sql, null);
			
			return list;
		}
		
		//新增分类
		public int newsTypeAdd(String nt_name){
			
			String sql = "insert into news_type(nt_name,nt_dr) values(?,?)";
			
			Integer res = jd.updateData(sql, new Object[]{nt_name,true});
			
			return res;
		}
		
		//编辑分类
		public int newsTypeUpdate(NewsType newsType){
			
			String sql = "update news_type set nt_name=? where nt_id=?";
			
			Integer res = jd.updateData(sql, new Object[]{newsType.getNt_name(),newsType.getNt_id()});
			
			return res;
		}
		
		public Map<String , Object> queryOne(Integer id){
			String sql = "select * from news_type where nt_id = "+id;
			
			Map<String, Object> map = jd.queryOne(sql, null);
			
			return map;
		}
		
		public Integer newsTypeDel(Integer id){
			String sql = "update news_type set nt_dr = false where nt_id = "+id;
			
			Integer res = jd.updateData(sql, null);
			
			return res;
		}
}
