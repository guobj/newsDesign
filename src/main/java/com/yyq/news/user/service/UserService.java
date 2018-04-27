package com.yyq.news.user.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.yyq.news.context.service.NewsService;
import com.yyq.news.user.dao.UserDao;

public class UserService {

	//单例模式
	private static UserService userService = null;
	private UserService() {}
	public static UserService getInstance(){
		if(userService == null){
			synchronized(UserService.class){
				if(userService == null){
					userService = new UserService();
				}
			}
		}
		return userService;
	}
	
	UserDao dao = UserDao.getInstance();
	
	//查询用户信息
	public List<Map<String, Object>> userList(int pages,HttpServletRequest request){
		
		List<Map<String, Object>> list = dao.userList(pages, request);
		
		if(list == null || list.size() <= 0){
			throw new RuntimeException("暂无数据");
		}
		
		return list;
	}
}
