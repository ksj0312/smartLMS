package com.smart.lms.vo;

import java.sql.Timestamp;

public class CommentVO {
	private int co_number;
	private int b_number;
	private String id;
	private String co_info;
	private Timestamp co_create_date;
	private Timestamp co_modify_date;
	
	public int getCo_number() {
		return co_number;
	}
	public void setCo_number(int co_number) {
		this.co_number = co_number;
	}
	public int getB_number() {
		return b_number;
	}
	public void setB_number(int b_number) {
		this.b_number = b_number;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCo_info() {
		return co_info;
	}
	public void setCo_info(String co_info) {
		this.co_info = co_info;
	}
	public Timestamp getCo_create_date() {
		return co_create_date;
	}
	public void setCo_create_date(Timestamp co_create_date) {
		this.co_create_date = co_create_date;
	}
	public Timestamp getCo_modify_date() {
		return co_modify_date;
	}
	public void setCo_modify_date(Timestamp co_modify_date) {
		this.co_modify_date = co_modify_date;
	}
	
	@Override
	public String toString() {
		return "CommentVO [co_number=" + co_number + ", b_number=" + b_number + ", id=" + id + ", co_info=" + co_info
				+ ", co_create_date=" + co_create_date + ", co_modify_date=" + co_modify_date + "]";
	}
	
}
