package com.yyq.news.context.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.yyq.news.context.dao.NewsDao;
import com.yyq.news.context.dao.NewsTypeDao;
import com.yyq.news.context.model.News;

public class NewsService {

	//单例模式
	private static NewsService newsService = null;
	private NewsService() {}
	public static NewsService getInstance(){
		if(newsService == null){
			synchronized(NewsService.class){
				if(newsService == null){
					newsService = new NewsService();
				}
			}
		}
		return newsService;
	}
	
	//实例化dao
	NewsDao dao = NewsDao.getInstance();
	NewsTypeDao ntDao = NewsTypeDao.getInstance();
	
	//查询所有新闻信息
	public List<Map<String,Object>> newsList(int pages,HttpServletRequest request){
		
		List<Map<String,Object>> list = dao.newsList(pages,request);
		
		if(list == null || list.size()==0){
			throw new RuntimeException("暂无数据");
		}
		return list;
	}
	
	//添加新闻
	public int newsAdd(News news){
		
		Integer res = dao.newsAdd(news);
		
		if(res <= 0){
			throw new RuntimeException("添加失败");
		}
		return res;
	}
	
	//查询一条记录
	public Map<String, Object> queryOne(Integer id){
		
		//分类列表
		List<Map<String, Object>> list = ntDao.queryForList();
		
		//要修改的原数据
		Map<String, Object> map = dao.queryOne(id);
		
		map.put("type", list);
		
		return map;
	}
	
	//编辑新闻信息
	public int newsUpdate(News news){
		
		Integer res = dao.newsUpdate(news);
		if(res <= 0){
			throw new RuntimeException("编辑失败");
		}
		return res;
	}
	
	//删除新闻-逻辑删除-即更新dr字段
	public int newsDel(Integer id){
		
		Integer res = dao.newsDel(id);
		if(res <= 0){
			throw new RuntimeException("删除失败");
		}
		return res;
	}
	
	/*
	 * 以下方法为前台专用，请勿随便调用
	 * 
	 */
	
	public List<Map<String, Object>> queryAll(){
		
		List<Map<String, Object>> list = dao.queryAll();
		
		if(list == null || list.size() <= 0){
			throw new RuntimeException("暂无数据");
		}
		
		return list;
	}
}
