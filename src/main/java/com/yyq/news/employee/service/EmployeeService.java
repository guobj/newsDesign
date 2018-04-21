package com.yyq.news.employee.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.yyq.news.employee.dao.EmployeeDao;
import com.yyq.news.employee.model.Employee;

public class EmployeeService {

	//单例模式
	private static EmployeeService employeeService = null;
	private EmployeeService() {}
	public static EmployeeService getInstance(){
		if(employeeService == null){
			synchronized(EmployeeService.class){
				if(employeeService == null){
					employeeService = new EmployeeService();
				}
			}
		}
		return employeeService;
	}
	
	EmployeeDao dao = EmployeeDao.getInstance();
	
	//查询所有新闻信息
	public List<Map<String,Object>> queryListForPage(int pages,HttpServletRequest request){
		
		List<Map<String,Object>> list = dao.queryListForPage(pages, request);
		
		if(list == null || list.size()==0){
			throw new RuntimeException("暂无数据");
		}
		return list;
	}
	
	//添加员工
	public Integer employeeAdd(Employee employee){
		
		Integer res = dao.employeeAdd(employee);
		if(res <= 0){
			throw new RuntimeException("添加失败！");
		}
		return res;
	}
}
