package com.yyq.news.context.dao;

import java.util.List;
import java.util.Map;

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
		
		public List<Map<String, Object>> queryForList(){
			
			String sql = "select * from news_type where nt_dr = 1";
			
			List<Map<String, Object>> list = jd.query(sql, null);
			
			return list;
		}
}
