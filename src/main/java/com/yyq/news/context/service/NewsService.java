package com.yyq.news.context.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.w3c.dom.ls.LSInput;

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
	
	//查询公司所有新闻信息
	public List<Map<String,Object>> companyNewsList(int pages,HttpServletRequest request){
		
		List<Map<String,Object>> list = dao.companyNewsList(pages,request);
		
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
	
	public Map<String, Object> queryAll(){
		
		Map<String, Object> map = dao.queryAll();
		
//		List<Map<String, Object>> type = ntDao.queryForList();
		
		if(map.isEmpty()){
			throw new RuntimeException("暂无数据");
		}
		
		return map;
	}
	
	//按照分类查询新闻
	public Map<String, Object> queryByType(Integer nt_id){
		
		Map<String, Object> map = dao.queryByType(nt_id);
		
		if(map.isEmpty()){
			throw new RuntimeException("暂无数据");
		}
		
		return map;
	}
	
	public Map<String, Object> queryOneForForward(Integer id,Integer sign){
		//分类列表
		List<Map<String, Object>> list = ntDao.queryForList();
		
		//要修改的原数据
		Map<String, Object> map = dao.queryOneForForward(id,sign);
		
		map.put("type", list);
		
		return map;
	}
	
	//模糊搜索 根据标题
	public Map<String, Object> queryByTitle(String title){
		
		Map<String, Object> map = dao.queryByTitle(title);
		if(map.isEmpty()){
			throw new RuntimeException("暂无相关记录");
		}
		return map;
	}
	
	//根据user ID查询新闻
	public List<Map<String, Object>> queryByUserId(Integer id){
		
		List<Map<String, Object>> list = dao.queryByUserId(id);
		
		if(list == null || list.size() <= 0){
			throw new RuntimeException("暂无数据");
		}
		
		return list;
	}
	
	//查询一条最新新闻
	public Map<String, Object> queryLatestbyUserID(Integer id,Integer sign){
		
		Map<String, Object> map = dao.queryLatestbyUserID(id, sign);
		
		return map;
	}
}
