package com.yyq.news.employee.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.yyq.news.employee.model.Employee;
import com.yyq.news.utils.JdbcUtils;
import com.yyq.news.utils.PageUtil;

public class EmployeeDao {

	//单例模式
	private static EmployeeDao ed = null;
	private EmployeeDao() {}
	public static EmployeeDao getInstance(){
		if(ed == null){
			synchronized(EmployeeDao.class){
				if(ed == null){
					ed = new EmployeeDao();
				}
			}
		}
		return ed;
	}
	
	//取到JDBC实例
	JdbcUtils jd = JdbcUtils.getInstance();
	
	//分页查询
	public List<Map<String, Object>> queryListForPage(int pages,HttpServletRequest request){
		StringBuilder sqls = new StringBuilder("select * from employee e left join authority a on e.fk_p_id = a.p_id where e.e_dr=1");
		
		if(request.getParameter("e_name")!=null&&request.getParameter("e_name").trim()!=""){
			sqls=sqls.append(" and e_name like '%"+request.getParameter("e_name").trim()+"%'");
			request.setAttribute("e_name", request.getParameter("e_name"));
		}
		if(request.getParameter("e_tel")!=null&&request.getParameter("e_tel").trim()!=""){
			sqls=sqls.append(" and e_tel like '%"+request.getParameter("e_tel").trim()+"%'");
			request.setAttribute("e_tel", request.getParameter("e_tel"));
		}
		
		String sql = sqls.toString();
		@SuppressWarnings("static-access")
		List<Map<String, Object>> list = PageUtil.getInstance().ListForPage(sql, jd, request, pages);
		return list;
	}
	
	//添加员工
	public Integer employeeAdd(Employee employee){
		
		String sql = "insert into employee(e_name,e_sex,e_age,e_address,fk_p_id,e_tel,e_email,account,password,e_dr) values(?,?,?,?,?,?,?,?,?,?)";
		
		int res = jd.updateData(sql, new Object[]{employee.getE_name(),employee.getE_sex(),employee.getE_age(),employee.getE_address(),
				employee.getFk_p_id(),employee.getE_tel(),employee.getE_email(),employee.getAccount(),"1234",true});
		return res;
	}
	
	//编辑员工
	public Integer employeeUpdate(Employee employee){
		
		String sql = "update employee set e_name = ?,e_sex = ?,"
				+ "e_age = ?,e_address = ?,fk_p_id = ?,"
				+ "e_tel = ?,e_email = ? where e_id = ?";
		
		Integer res = jd.updateData(sql, new Object[]{employee.getE_name(),employee.getE_sex(),employee.getE_age(),employee.getE_address(),
				employee.getFk_p_id(),employee.getE_tel(),employee.getE_email(),employee.getE_id()});
		
		return res;
		
	}
	
	//查询一条记录
	public Map<String, Object> queryOne(Integer id){
		
		String sql = "select * from employee where e_id = "+id;
		
		Map<String, Object> map = jd.queryOne(sql, null);
		
		return map;
	}
	
	//删除记录-逻辑删除
	public Integer employeeDel(Integer id){
		String sql = "update employee set e_dr = false where e_id = "+id;
		
		Integer res = jd.updateData(sql, null);
		
		return res;
	}
}
