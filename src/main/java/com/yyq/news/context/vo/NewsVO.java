package com.yyq.news.context.vo;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.yyq.news.utils.JdbcUtils;

public class NewsVO {
	
	//主键
		private Integer n_id;
		
		//内容
		private String content;
		
		//作者
		private String auth;
		
		//图片
		private String img;
		
		//分类-外键
		private String fk_nt_id;
		
		//发布时间
		private Date creat_time;
		
		//修改时间
		private Date update_time;

		//标题
		private String title;
		
		//是否删除
		private Boolean dr;
		
		public Integer getN_id() {
			return n_id;
		}

		public void setN_id(Integer n_id) {
			this.n_id = n_id;
		}

		public String getContent() {
			return content;
		}

		public void setContent(String content) {
			this.content = content;
		}

		public String getAuth() {
			return auth;
		}

		public void setAuth(String auth) {
			this.auth = auth;
		}

		public String getImg() {
			return img;
		}

		public void setImg(String img) {
			this.img = img;
		}

		public String getFk_nt_id() {
			return fk_nt_id;
		}

		public void setFk_nt_id(String fk_nt_id) {
			this.fk_nt_id = fk_nt_id;
		}

		public Date getCreat_time() {
			return creat_time;
		}

		public void setCreat_time(Date creat_time) {
			this.creat_time = creat_time;
		}

		public Date getUpdate_time() {
			return update_time;
		}

		public void setUpdate_time(Date update_time) {
			this.update_time = update_time;
		}

		public String getTitle() {
			return title;
		}

		public void setTitle(String title) {
			this.title = title;
		}

		public Boolean getDr() {
			return dr;
		}

		public void setDr(Boolean dr) {
			this.dr = dr;
		}
	
}
