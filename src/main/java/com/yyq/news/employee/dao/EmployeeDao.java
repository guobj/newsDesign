package com.yyq.news.employee.dao;

import com.yyq.news.utils.JdbcUtils;

public class EmployeeDao {

	//单例模式
	private static EmployeeDao ed = null;
	private EmployeeDao() {}
	public static EmployeeDao getInstance(){
		if(ed == null){
			synchronized(EmployeeDao.class){
				if(ed == null){
					ed = new EmployeeDao();
				}
			}
		}
		return ed;
	}
	
	//取到JDBC实例
	JdbcUtils jd = JdbcUtils.getInstance();
	
	
}
