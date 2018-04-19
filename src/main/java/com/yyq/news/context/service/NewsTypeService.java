package com.yyq.news.context.service;

import java.util.List;
import java.util.Map;

import com.yyq.news.context.dao.NewsTypeDao;

public class NewsTypeService {

	//单例模式
	private static NewsTypeService newsService = null;
	private NewsTypeService() {}
	public static NewsTypeService getInstance(){
		if(newsService == null){
			synchronized(NewsTypeService.class){
				if(newsService == null){
					newsService = new NewsTypeService();
				}
			}
		}
		return newsService;
	}
	
	//实例化dao
	NewsTypeDao dao = NewsTypeDao.getInstance();
	
	public List<Map<String, Object>> queryForList(){
		
		List<Map<String, Object>> list = dao.queryForList();
		
		if(list == null || list.size() <= 0){
			throw new RuntimeException("暂无数据");
		}
		return list;
	}
}
