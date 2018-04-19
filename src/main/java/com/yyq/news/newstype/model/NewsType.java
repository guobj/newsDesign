package com.yyq.news.newstype.model;

public class NewsType {

	private Integer nt_id;
	
	//类别名称
	private String nt_name;
	
	//是否有效
	private Boolean nt_dr;

	public Integer getNt_id() {
		return nt_id;
	}

	public void setNt_id(Integer nt_id) {
		this.nt_id = nt_id;
	}

	public String getNt_name() {
		return nt_name;
	}

	public void setNt_name(String nt_name) {
		this.nt_name = nt_name;
	}

	public Boolean getNt_dr() {
		return nt_dr;
	}

	public void setNt_dr(Boolean nt_dr) {
		this.nt_dr = nt_dr;
	}
	
	
}
