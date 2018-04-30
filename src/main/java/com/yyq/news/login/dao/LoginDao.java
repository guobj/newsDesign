package com.yyq.news.login.dao;

import java.util.Map;

import com.yyq.news.employee.dao.EmployeeDao;
import com.yyq.news.utils.JdbcUtils;

public class LoginDao {

	//单例模式
	private static LoginDao ld = null;
	private LoginDao() {}
	public static LoginDao getInstance(){
		if(ld == null){
			synchronized(LoginDao.class){
				if(ld == null){
					ld = new LoginDao();
				}
			}
		}
		return ld;
	}
	
	//取到JDBC实例
	JdbcUtils jd = JdbcUtils.getInstance();
	
	//后台登录
	public Map<String, Object> login(String account,String password){
		
		String sql = "select * from employee where account = ? and password = ?";
		
		Map<String, Object> map = jd.login(sql, account, password);
		
		return map;
	}
	
	//前台登陆
	public Map<String, Object> loginForward(String account,String password){
		
		String sql = "select * from user where account = ? and password = ?";
		
		Map<String, Object> map = jd.login(sql, account, password);
		
		return map;
	}
	
}
