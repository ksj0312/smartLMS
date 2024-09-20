package com.smart.lms.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class TodateVO {
	private int c_number;
	private String id;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date a_date;
	private String a_status;
	
	public int getC_number() {
		return c_number;
	}
	public void setC_number(int c_number) {
		this.c_number = c_number;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getA_date() {
		return a_date;
	}
	public void setA_date(Date a_date) {
		this.a_date = a_date;
	}
	public String getA_status() {
		return a_status;
	}
	public void setA_status(String a_status) {
		this.a_status = a_status;
	}
	
	@Override
	public String toString() {
		return "TodateVO [c_number=" + c_number + ", id=" + id + ", a_date=" + a_date + ", a_status=" + a_status + "]";
	}


	
}
