package com.yyq.news.employee.dao;

import java.util.List;
import java.util.Map;

import com.yyq.news.utils.JdbcUtils;

public class AuthorityDao {

	private static AuthorityDao ad = null;
	private AuthorityDao(){};
	public static AuthorityDao getInstance(){
		if(ad == null){
			synchronized(AuthorityDao.class){
				if(ad == null){
					ad = new AuthorityDao();
				}
			}
		}
		return ad;
	}
	
	JdbcUtils jd = JdbcUtils.getInstance();
	
	//查询所有角色信息
	public List<Map<String, Object>> queryList(){
		
		String sql = "select * from authority";
		List<Map<String, Object>> list = jd.query(sql, null);
		return list;
	}
}
