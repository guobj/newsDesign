package com.yyq.news.utils;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public class PageUtil {
	private static PageUtil pu = null;
	
	private PageUtil() {}
	public static PageUtil getInstance(){
		if(pu == null){
			synchronized(PageUtil.class){
				if(pu == null){
					pu = new PageUtil();
				}
			}
		}
		return pu;
	}
	
	//分页工具类
	public static List<Map<String, Object>> ListForPage(String sql,JdbcUtils jd,HttpServletRequest request,int pages){
		//查询一共有多少条数据
		int count=jd.count(sql, null);
		
		//按照每页4条数据进行分页，计算共有多少页
		int sumPage=(count%4==0)?(count/4):(count/4+1);
		
		//调用jdbc封装类与与数据库进行交互
		List<Map<String, Object>> plist = jd.ListForPage(sql, pages, 4, null);
		request.setAttribute("sumPage", sumPage);
		request.setAttribute("pages", pages);
		return plist;
	}
}
