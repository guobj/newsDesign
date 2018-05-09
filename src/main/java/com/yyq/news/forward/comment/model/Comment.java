package com.yyq.news.forward.comment.model;

public class Comment {

	private Integer c_id;
	
	private Integer fk_n_id;
	
	private Integer fk_u_id;

	private String create_time;
	
	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	private String comment;
	public String getCreate_time() {
		return create_time;
	}

	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}

	public Integer getC_id() {
		return c_id;
	}

	public void setC_id(Integer c_id) {
		this.c_id = c_id;
	}

	public Integer getFk_n_id() {
		return fk_n_id;
	}

	public void setFk_n_id(Integer fk_n_id) {
		this.fk_n_id = fk_n_id;
	}

	public Integer getFk_u_id() {
		return fk_u_id;
	}

	public void setFk_u_id(Integer fk_u_id) {
		this.fk_u_id = fk_u_id;
	}
	
	
}
