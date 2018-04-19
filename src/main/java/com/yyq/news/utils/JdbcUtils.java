package com.yyq.news.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class JdbcUtils {
	private static JdbcUtils jdbc = null;
	private Connection conn=null;
	private PreparedStatement ps=null;
	private ResultSet rs=null;
	private String user="root";
	private String password="root";
	private String url="jdbc:mysql://localhost:3306/newsapp?autoReconnect=true&amp;useUnicode=true&amp;characterEncoding=utf-8";
	
	private JdbcUtils() {}
	public static JdbcUtils getInstance(){
		if(jdbc == null){
			synchronized(JdbcUtils.class){
				if(jdbc == null){
					jdbc = new JdbcUtils();
				}
			}
		}
		return jdbc;
	}
	
	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public Connection getConn(){
		try {
			conn=(conn==null||conn.isClosed())?DriverManager.getConnection(url, user, password):conn;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;	
	}

	//登录
	public Map<String,Object> login(String sql,String account,String password){
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			ps=getConn().prepareStatement(sql);
			ps.setObject(1, account);
			ps.setObject(2, password);
			rs=ps.executeQuery();
			while(rs.next()){
				//获得所有字段名
				ResultSetMetaData rsmd=rs.getMetaData();
				//获得字段数量
				int columnCount=rsmd.getColumnCount();
				for(int i=0;i<columnCount;i++){
					//获得字段名
					String columnName=rsmd.getColumnLabel(i+1);
					map.put(columnName, rs.getObject(columnName));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close();
		}
//		System.out.println(sql);
//		System.out.println(map);
		return map;
		
	}

	////查询
	public List<Map<String,Object>> query(String sql,Object[] params){
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		try {
			ps=getConn().prepareStatement(sql);
			setParams(params);
			rs=ps.executeQuery();
			while(rs.next()){
				Map<String, Object> map = new HashMap<String,Object>();
				ResultSetMetaData rsmd = rs.getMetaData();
				int columnCount = rsmd.getColumnCount();
				for(int i=0;i<columnCount;i++){
					String columnName = rsmd.getColumnLabel(i+1);
					map.put(columnName, rs.getObject(columnName));
				}
				list.add(map);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("数据查询失败"+e.getMessage());
		}finally{
			close();
		}
		return list;
	}

	//分页及模糊查询
	public List<Map<String,Object>> ListForPage(String sql,int pages,int record,Object[] params){
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		String sqls = "select * from ("+sql+") ccshxt limit "+(pages-1)*record+","+record+"";
		try {
			ps=getConn().prepareStatement(sqls);
			setParams(params);
			rs=ps.executeQuery();
			while(rs.next()){
				Map<String, Object> map = new HashMap<String,Object>();
				ResultSetMetaData rsmd = rs.getMetaData();
				int columnCount = rsmd.getColumnCount();
				for(int i=0;i<columnCount;i++){
					String columnName = rsmd.getColumnLabel(i+1);
					map.put(columnName, rs.getObject(columnName));
				}
				list.add(map);
			}
			
		} catch (SQLException e) {
			System.out.println("数据查询失败"+e.getMessage());
		}finally{
			close();
		}
		return list;
	}

	//总数据
	public ResultSet queryCount(String sql,Object[] params){
		try {
			ps=getConn().prepareStatement(sql);
			setParams(params);
			return ps.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	public int count(String sql,Object[] params){
		String sqls="select count(*) records from ("+sql+") temp";
		try {
			rs=queryCount(sqls, params);
			if(rs.next()){
				return rs.getInt("records");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	//更新
	public int updateData(String sql,Object[] params){
		int result=0;
		try {
			ps=getConn().prepareStatement(sql);
			setParams(params);
			result = ps.executeUpdate();
		} catch (SQLException e) {
			result=-1;
			e.printStackTrace();
		}finally {
			close();
		}
		return result;
	}

	//设置占位符
	public void setParams(Object[] params){
		try {
			if(params!=null){
				for(int i=0;i<params.length;i++){
					ps.setObject(i+1, params[i]);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//查询一条数据
	public Map<String,Object> queryOne(String sql,Object[] params){
		Map<String, Object> map = new HashMap<String,Object>();
		try {
			ps=getConn().prepareStatement(sql);
			setParams(params);
			rs=ps.executeQuery();
			while(rs.next()){
				ResultSetMetaData rsmd = rs.getMetaData();
				int columnCount = rsmd.getColumnCount();
				for(int i=0;i<columnCount;i++){
					String columnName = rsmd.getColumnLabel(i+1);
					map.put(columnName, rs.getObject(columnName));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close();
		}
		return map;
	}

	//关闭所有连接
	public void close(){
		try {
			if(rs!=null&&!rs.isClosed()){
				rs.close();
			}
			if(ps!=null&&!ps.isClosed()){
				ps.close();
			}
			if(conn!=null&&!conn.isClosed()){
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
