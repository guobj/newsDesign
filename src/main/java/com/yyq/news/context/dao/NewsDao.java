package com.yyq.news.context.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.w3c.dom.ls.LSInput;

import com.yyq.news.context.model.News;
import com.yyq.news.utils.JdbcUtils;
import com.yyq.news.utils.PageUtil;

public class NewsDao {
	
	//单例模式
	private static NewsDao nd = null;
	private NewsDao() {}
	public static NewsDao getInstance(){
		if(nd == null){
			synchronized(NewsDao.class){
				if(nd == null){
					nd = new NewsDao();
				}
			}
		}
		return nd;
	}
	
	//取到JDBC实例
	JdbcUtils jd = JdbcUtils.getInstance();
	
	//查询用户所有新闻信息
	public List<Map<String, Object>> newsList(int pages,HttpServletRequest request){
		
		StringBuilder sqls = new StringBuilder("SELECT * from news n LEFT JOIN news_type nt on n.fk_nt_id=nt.nt_id"
				+ " LEFT JOIN `user` u  on n.auth=u.u_id where n.dr=1 and nt.nt_dr=1 and n.sign = 1");
		
		if(request.getParameter("title")!=null&&request.getParameter("title").trim()!=""){
			sqls=sqls.append(" and title like '%"+request.getParameter("title").trim()+"%'");
			request.setAttribute("title", request.getParameter("title"));
		}
		if(request.getParameter("nt_name")!=null&&request.getParameter("nt_name").trim()!=""){
			sqls=sqls.append(" and nt.nt_name like '%"+request.getParameter("nt_name").trim()+"%'");
			request.setAttribute("nt_name", request.getParameter("nt_name"));
		}
		
		sqls.append(" order by creat_time DESC");
		String sql = sqls.toString();
		@SuppressWarnings("static-access")
		List<Map<String, Object>> list = PageUtil.getInstance().ListForPage(sql, jd, request, pages);
		return list;
		
	}
	
	//查询所有公司新闻信息
	public List<Map<String, Object>> companyNewsList(int pages,HttpServletRequest request){
		
		//sql语句
		StringBuilder sqls = new StringBuilder("SELECT * from news n LEFT JOIN news_type nt on n.fk_nt_id=nt.nt_id"
				+ " LEFT JOIN employee e on n.auth=e.e_id where n.dr=1 and nt.nt_dr=1 and n.sign = 0");
		
		//模糊查询拼接的条件，条件为null时，不拼接条件，执行原始sqls
		if(request.getParameter("title")!=null&&request.getParameter("title").trim()!=""){
			sqls=sqls.append(" and title like '%"+request.getParameter("title").trim()+"%'");
			request.setAttribute("title", request.getParameter("title"));
		}
		if(request.getParameter("nt_name")!=null&&request.getParameter("nt_name").trim()!=""){
			sqls=sqls.append(" and nt.nt_name like '%"+request.getParameter("nt_name").trim()+"%'");
			request.setAttribute("nt_name", request.getParameter("nt_name"));
		}
		
		String sql = sqls.toString();
		@SuppressWarnings("static-access")
		List<Map<String, Object>> list = PageUtil.getInstance().ListForPage(sql, jd, request, pages);
		return list;
		
	}
	
	//添加新闻
	public int newsAdd(News news){
		
		String sql = "insert into news(title,fk_nt_id,auth,dr,content,img,creat_time,update_time,sign)"
				+ " value(?,?,?,?,?,?,?,?,?)";
		
		Integer res = jd.updateData(sql, new Object[]{news.getTitle(),news.getFk_nt_id(),
				news.getAuth(),news.getDr(),news.getContent(),
				news.getImg(),news.getCreat_time(),news.getUpdate_time(),news.getSign()});
		
		return res; 
		
	}
	
	//查询一条记录
	public Map<String, Object> queryOne(Integer id){
		
		String sql = "select * from news n where n.n_id = ?";
		
		String commentSql = "select * from `comment` c LEFT JOIN `user` u ON c.fk_u_id=u.u_id where c.fk_n_id = ?";
		
		List<Map<String, Object>> list = jd.query(commentSql, new Object[]{id});
		
		Map<String, Object> map = jd.queryOne(sql, new Object[]{id});
		
		map.put("list", list);
		
		return map;
	}
	
	//编辑新闻
	public int newsUpdate(News news){
		
		String sql = "update news set title=?,fk_nt_id=?,update_time=?,content=? where n_id=?";
		
		Integer res = jd.updateData(sql, new Object[]{news.getTitle(),news.getFk_nt_id(),news.getUpdate_time(),news.getContent(),news.getN_id()});
		
		return res;
	}
	
	//删除新闻-逻辑删除-即更新dr字段
	public int newsDel(Integer id){
		
		String sql = "update news set dr = false where n_id = "+id;
		
		Integer res = jd.updateData(sql, null);
		
		return res;
	}
	
	/*
	 * 以下方法为前台专用，请勿随便调用
	 * 
	 */
	
	//查询新闻
	public Map<String, Object> queryAll(){
		
		String sql = "select * from news n left join news_type nt on "
				+ "n.fk_nt_id=nt.nt_id where n.sign = 1 and n.dr=1 and nt.nt_dr=1 order by creat_time DESC";
		
		String sql2 = "select * from news n left join news_type nt on "
				+ "n.fk_nt_id=nt.nt_id LEFT JOIN employee e ON e.e_id = "
				+ "n.auth where n.sign = 0 and n.dr=1 and nt.nt_dr=1  order by creat_time DESC";
		
		List<Map<String, Object>> cList = jd.query(sql2, null);
		List<Map<String, Object>> list = jd.query(sql, null);
		
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("cList", cList);
		return map;
	}
	
	//按照分类查询新闻
	public Map<String, Object> queryByType(Integer nt_id){
		
		String sql = "select * from news n left join news_type nt on "
				+ "n.fk_nt_id=nt.nt_id where n.sign = 1 and n.dr=1 and nt.nt_dr=1 and nt.nt_id = "+nt_id;
		
		//右边24小时的数据
		String sql2 = "select * from news n left join news_type nt on "
				+ "n.fk_nt_id=nt.nt_id LEFT JOIN employee e ON e.e_id = "
				+ "n.auth where n.sign = 0 and n.dr=1 and nt.nt_dr=1";
		
		List<Map<String, Object>> cList = jd.query(sql2, null);
		List<Map<String, Object>> list = jd.query(sql, null);
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("list", list);
		map.put("cList", cList);
		return map;
	}
	
	//查询一条记录
	public Map<String, Object> queryOneForForward(Integer id,Integer sign){
		
		String sql = "";
		
		if(sign.equals(1) && sign == 1){
			sql = "select * from news n left join user u on n.auth=u.u_id where n.sign=1 and n.n_id = ?";
		}else{
			sql = "select * from news n left join employee e on n.auth=e.e_id where n.sign=0 and n.n_id = ?";
		}
		
		
		String commentSql = "select * from `comment` c LEFT JOIN `user` u ON c.fk_u_id=u.u_id where c.fk_n_id = ?";
		
		List<Map<String, Object>> list = jd.query(commentSql, new Object[]{id});
		
		Map<String, Object> map = jd.queryOne(sql, new Object[]{id});
		
		map.put("list", list);
		
		return map;
	}
	
	//模糊搜索  根据标题
	public Map<String, Object> queryByTitle(String title){
		
		String sql = "select * from news where title like '%"+title+"%'";
		//右边24小时的数据
		String sql2 = "select * from news n left join news_type nt on "
				+ "n.fk_nt_id=nt.nt_id LEFT JOIN employee e ON e.e_id = "
				+ "n.auth where n.sign = 0 and n.dr=1 and nt.nt_dr=1";
		
		List<Map<String, Object>> cList = jd.query(sql2, null);
		List<Map<String, Object>> list = jd.query(sql, null);
		
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("cList", cList);
		return map;
	}
	
	//根据user ID查询新闻
	public List<Map<String, Object>> queryByUserId(Integer id){
		
		String sql = "select * from news where sign = 1 and auth = "+id;
		
		List<Map<String, Object>> list = jd.query(sql, null);
		
		return list;
	}
	
	//查询一条最新新闻
	public Map<String, Object> queryLatestbyUserID(Integer id,Integer sign){
		
		String sql = "select n.*,MAX(creat_time) from news n WHERE n.sign = ? and n.dr = 1 AND auth = ?";
		
		Map<String, Object> map = jd.queryOne(sql, new Object[]{sign,id});
		
		return map;
	}
}
