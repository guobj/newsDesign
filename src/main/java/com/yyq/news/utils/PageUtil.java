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
	
	public static List<Map<String, Object>> ListForPage(String sql,JdbcUtils jd,HttpServletRequest request,int pages){
		int count=jd.count(sql, null);
		int sumPage=(count%4==0)?(count/4):(count/4+1);
		List<Map<String, Object>> plist = jd.ListForPage(sql, pages, 4, null);
		request.setAttribute("sumPage", sumPage);
		request.setAttribute("pages", pages);
		return plist;
	}
}
