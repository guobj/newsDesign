package com.yyq.news.context.service;

import java.util.List;
import java.util.Map;

import com.yyq.news.context.dao.NewsTypeDao;
import com.yyq.news.context.model.NewsType;

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
	
	//新增分类
	public Integer newsTypeAdd(String nt_name){
		
		Integer res = dao.newsTypeAdd(nt_name);
		
		if(res <= 0){
			throw new RuntimeException("新增失败");
		}
		
		return res;
	}
	
	//编辑分类
	public Integer newsTypeUpdate(NewsType newsType){
		
		Integer res = dao.newsTypeUpdate(newsType);
		
		if(res <= 0){
			throw new RuntimeException("编辑失败");
		}
		
		return res;
	}
	
	//查询一条记录
	public Map<String, Object> queryOne(Integer id){
		Map<String, Object> map = dao.queryOne(id);
		return map;
	}
	
	//删除
	public Integer newsTypeDel(Integer id){
		
		Integer res = dao.newsTypeDel(id);
		
		if(res <= 0){
			throw new RuntimeException("编辑失败");
		}
		
		return res;
	}
}
