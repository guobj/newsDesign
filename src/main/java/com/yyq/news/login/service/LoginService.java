package com.yyq.news.login.service;

import java.util.Map;

import com.yyq.news.login.dao.LoginDao;

public class LoginService {

	//单例模式
	private static LoginService loginService = null;
	private LoginService() {}
	public static LoginService getInstance(){
		if(loginService == null){
			synchronized(LoginService.class){
				if(loginService == null){
					loginService = new LoginService();
				}
			}
		}
		return loginService;
	}
	
	//实例化dao
	LoginDao dao = LoginDao.getInstance();
	
	//后台登录
	public Map<String, Object> login(String account,String password){
		
		Map<String, Object> map = dao.login(account, password);
		if(map.isEmpty()){
			throw new RuntimeException("用户名或密码错误");
		}
		return map;
	}
	
	//前台登录
	public Map<String, Object> loginForward(String account,String password){
		
		Map<String, Object> map = dao.loginForward(account, password);
		if(map.isEmpty()){
			throw new RuntimeException("用户名或密码错误");
		}
		return map;
	}
}
