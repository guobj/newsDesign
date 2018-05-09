package com.yyq.news.user.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.yyq.news.context.service.NewsService;
import com.yyq.news.user.dao.UserDao;
import com.yyq.news.user.model.User;

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
	
	
	/**
	 * 
	 * 
	 * 以下接口为前台所用，请勿随便调用
	 * 
	 * 
	 */
	//查询账号是否存在
	public Map<String, Object> queryUserByAccount(String account){
		
		Map<String, Object> map = dao.queryUserByAccount(account);
		
		if(!map.isEmpty()){
			throw new RuntimeException("账号已存在");
		}
		
		return map;
	}
	
	//用户注册
	public Integer register(User user){
		
		Integer res = dao.register(user);
		
		if(res <= 0){
			throw new RuntimeException("注册失败");
		}
		
		return res;
	}
	
	//查询用户信息
	public Map<String, Object> queryUserInfoById(Integer id){
		
		Map<String, Object> map = dao.queryUserInfoById(id);
		
		if(map.isEmpty()){
			throw new RuntimeException("用户不存在");
		}
		
		return map;
	}
}
