package com.yyq.news.context.model;

import java.util.List;

public class News {

	//主键
	private Integer n_id;
	
	//内容
	private String content;
	
	//作者
	private Integer auth;
	
	public Integer getAuth() {
		return auth;
	}

	public void setAuth(Integer auth) {
		this.auth = auth;
	}

	//图片
	private String img;
	
	//分类-外键
	private String fk_nt_id;
	
	//发布时间
	private String creat_time;
	
	//修改时间
	private String update_time;

	//标题
	private String title;
	
	//是否删除 1-真 0-假
	private Boolean dr;
	
	private Integer fk_u_id;
	//标志公司级用户级，0公司级，1用户级
	private Integer sign;
	
	private List commentList;
	
	public List getCommentList() {
		return commentList;
	}

	public void setCommentList(List commentList) {
		this.commentList = commentList;
	}

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

	public String getCreat_time() {
		return creat_time;
	}

	public void setCreat_time(String creat_time) {
		this.creat_time = creat_time;
	}

	public String getUpdate_time() {
		return update_time;
	}

	public void setUpdate_time(String update_time) {
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

	public Integer getFk_u_id() {
		return fk_u_id;
	}

	public void setFk_u_id(Integer fk_u_id) {
		this.fk_u_id = fk_u_id;
	}

	public Integer getSign() {
		return sign;
	}

	public void setSign(Integer sign) {
		this.sign = sign;
	}
	
	
	
	
}
