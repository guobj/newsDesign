package com.yyq.news.employee.model;

public class Employee {

	private Integer e_id;
	
	private String e_name;
	
	private Integer e_sex;
	
	private Integer e_age;
	
	private String e_address;
	
	private Integer fk_p_id;
	
	private String e_tel;
	
	private String e_email;
	
	private String account;
	
	private String password;
	
	private Boolean e_dr;

	private String e_creat_time;
	public String getE_creat_time() {
		return e_creat_time;
	}

	public void setE_creat_time(String e_creat_time) {
		this.e_creat_time = e_creat_time;
	}

	public Integer getE_id() {
		return e_id;
	}

	public void setE_id(Integer e_id) {
		this.e_id = e_id;
	}

	public String getE_name() {
		return e_name;
	}

	public void setE_name(String e_name) {
		this.e_name = e_name;
	}

	public Integer getE_sex() {
		return e_sex;
	}

	public void setE_sex(Integer e_sex) {
		this.e_sex = e_sex;
	}

	public Integer getE_age() {
		return e_age;
	}

	public void setE_age(Integer e_age) {
		this.e_age = e_age;
	}

	public String getE_address() {
		return e_address;
	}

	public void setE_address(String e_address) {
		this.e_address = e_address;
	}

	public Integer getFk_p_id() {
		return fk_p_id;
	}

	public void setFk_p_id(Integer fk_p_id) {
		this.fk_p_id = fk_p_id;
	}

	public String getE_tel() {
		return e_tel;
	}

	public void setE_tel(String e_tel) {
		this.e_tel = e_tel;
	}

	public String getE_email() {
		return e_email;
	}

	public void setE_email(String e_email) {
		this.e_email = e_email;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Boolean getE_dr() {
		return e_dr;
	}

	public void setE_dr(Boolean e_dr) {
		this.e_dr = e_dr;
	}
	
	
}
