package com.yyq.news.utils;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

public class JsonUtil {

	 private static JsonUtil ju = null;
		
	private JsonUtil() {}
	public static JsonUtil getInstance(){
		if(ju == null){
			synchronized(JsonUtil.class){
				if(ju == null){
					ju = new JsonUtil();
				}
			}
		}
		return ju;
	}
	
	public void toJson(HttpServletResponse response,Object obj) throws IOException{
		
		Gson gson = new Gson();
		String data = gson.toJson(obj);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(data);
		out.flush();
		out.close();
		
	}
		
}
