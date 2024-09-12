package com.smart.lms.vo;

public class AttendClassVO {
	private int c_number;
	private String id;
	
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
	
	@Override
	public String toString() {
		return "AttendClassVO [c_number=" + c_number + ", id=" + id + "]";
	}
	
}
