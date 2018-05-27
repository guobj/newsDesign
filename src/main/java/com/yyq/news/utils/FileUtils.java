package com.yyq.news.utils;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

public class FileUtils {

	 private static FileUtils fu = null;
		
	private FileUtils() {}
	public static FileUtils getInstance(){
		if(fu == null){
			synchronized(FileUtils.class){
				if(fu == null){
					fu = new FileUtils();
				}
			}
		}
		return fu;
	}
	
	public String generateFileName(HttpServletRequest request) throws IOException, ServletException{
		
		//取得文件
		Part part = request.getPart("file");
		String root="D:/photo";
		File file = new File(root);
		
		//文件名
		String name=part.getHeader("content-disposition");
		//文件后缀（.jpg|.png|.gif）
		String ext=name.substring(name.lastIndexOf("."),name.length()-1);
		
		//切分字符串
		String[] nameArray=name.split("\"");
		String realName=nameArray[3];
		name=UUID.randomUUID().toString().replaceAll("-", "");
		String FileName=root+"/"+name+ext;
		part.write(FileName);
		request.setAttribute("name", name+ext);
		request.setAttribute("realname", realName);
		
		String fileName = name+ext;
		return fileName;
	}
}
