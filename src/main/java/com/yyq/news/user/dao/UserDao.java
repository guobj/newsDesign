package com.yyq.news.user.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.yyq.news.context.dao.NewsDao;
import com.yyq.news.utils.JdbcUtils;
import com.yyq.news.utils.PageUtil;

public class UserDao {

	//单例模式
	private static UserDao ud = null;
	private UserDao() {}
	public static UserDao getInstance(){
		if(ud == null){
			synchronized(UserDao.class){
				if(ud == null){
					ud = new UserDao();
				}
			}
		}
		return ud;
	}
	
	//取到JDBC实例
	JdbcUtils jd = JdbcUtils.getInstance();
	
	//查询所有用户信息
	public List<Map<String, Object>> userList(int pages,HttpServletRequest request){
		
		StringBuilder sqls = new StringBuilder("select * from user n where n.u_dr=1");
		
		if(request.getParameter("u_name")!=null&&request.getParameter("u_name").trim()!=""){
			sqls=sqls.append(" and u_name like '%"+request.getParameter("u_name").trim()+"%'");
			request.setAttribute("u_name", request.getParameter("u_name"));
		}
		if(request.getParameter("account")!=null&&request.getParameter("account").trim()!=""){
			sqls=sqls.append(" and account like '%"+request.getParameter("account").trim()+"%'");
			request.setAttribute("account", request.getParameter("account"));
		}
		
		String sql = sqls.toString();
		@SuppressWarnings("static-access")
		List<Map<String, Object>> list = PageUtil.getInstance().ListForPage(sql, jd, request, pages);
		return list;
		
	}
}