package com.yyq.news.employee.service;

import java.util.List;
import java.util.Map;

import com.yyq.news.employee.dao.AuthorityDao;

public class AuthorityService {

	//单例模式
	private static AuthorityService authorityService = null;
	private AuthorityService() {}
	public static AuthorityService getInstance(){
		if(authorityService == null){
			synchronized(AuthorityService.class){
				if(authorityService == null){
					authorityService = new AuthorityService();
				}
			}
		}
		return authorityService;
	}
	
	AuthorityDao dao = AuthorityDao.getInstance();
	
	//查询所有角色信息
	public List<Map<String, Object>> queryList(){
		
		List<Map<String, Object>> list = dao.queryList();
		
		if(list == null || list.size() <= 0){
			throw new RuntimeException("暂无数据");
		}
		
		return list;
	}
}
