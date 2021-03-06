package com.yyq.news.user.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.yyq.news.user.model.User;
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
	
	
	/*
	 * 前台调用接口-----请勿随便调用
	 * 
	 */
	
	//查询账号是否存在
	public Map<String, Object> queryUserByAccount(String account){
		
		String sql = "select * from user where account = ?";
		
		Map<String, Object> map = jd.queryOne(sql, new Object[]{account});
		
		return map;
	}
	
	//用户注册
	public Integer register(User user){
		String sql = "insert into user(account,password,u_dr,u_name) values(?,?,?,?)";
		
		Integer res = jd.updateData(sql, new Object[]{user.getAccount(),user.getPassword(),true,user.getU_name()});
		
		return res;
	}
	
	//查询用户信息
	public Map<String, Object> queryUserInfoById(Integer id){
		
		String sql = "select * from user where u_id = "+id;
		Map<String, Object> map = jd.queryOne(sql, null);
		return map;
	}
	
	//用户完善个人信息
	public Integer userUpdate(User user){
		
		String sql = "update user set u_address=?,u_tel=?,u_email=?,u_blog=?,u_profession=?,u_realname=?,u_create_time=? where u_id=?";
		
		Integer res = jd.updateData(sql, new Object[]{user.getU_address(),user.getU_tel(),user.getU_email(),user.getU_blog(),
				user.getU_profession(),user.getU_realname(),user.getU_create_time(),user.getU_id()});
		
		return res;
	}
	
	//用户上传头像
	public Integer userLog(String img,Integer id){
		
		String sql = "update user set u_img=? where u_id=?";
		
		Integer res = jd.updateData(sql, new Object[]{img,id});
		
		return res;
	}
}
