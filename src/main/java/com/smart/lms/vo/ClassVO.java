package com.smart.lms.vo;

import java.sql.Timestamp;

public class ClassVO {
	private int c_number;
	private String c_name;
	private Timestamp c_create_date;
	private Timestamp c_start_date;
	private Timestamp c_end_date;
	private String prof_name;
	private int stu_count;
	private String c_time;
	private String c_info;
	private String c_term;
	private String c_day;
	
	public int getC_number() {
		return c_number;
	}
	public void setC_number(int c_number) {
		this.c_number = c_number;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public Timestamp getC_create_date() {
		return c_create_date;
	}
	public void setC_create_date(Timestamp c_create_date) {
		this.c_create_date = c_create_date;
	}
	public Timestamp getC_start_date() {
		return c_start_date;
	}
	public void setC_start_date(Timestamp c_start_date) {
		this.c_start_date = c_start_date;
	}
	public Timestamp getC_end_date() {
		return c_end_date;
	}
	public void setC_end_date(Timestamp c_end_date) {
		this.c_end_date = c_end_date;
	}
	public String getProf_name() {
		return prof_name;
	}
	public void setProf_name(String prof_name) {
		this.prof_name = prof_name;
	}
	public int getStu_count() {
		return stu_count;
	}
	public void setStu_count(int stu_count) {
		this.stu_count = stu_count;
	}
	public String getC_time() {
		return c_time;
	}
	public void setC_time(String c_time) {
		this.c_time = c_time;
	}
	public String getC_info() {
		return c_info;
	}
	public void setC_info(String c_info) {
		this.c_info = c_info;
	}
	public String getC_term() {
		return c_term;
	}
	public void setC_term(String c_term) {
		this.c_term = c_term;
	}
	public String getC_day() {
		return c_day;
	}
	public void setC_day(String c_day) {
		this.c_day = c_day;
	}
	
	@Override
	public String toString() {
		return "ClassVO [c_number=" + c_number + ", c_name=" + c_name + ", c_create_date=" + c_create_date
				+ ", c_start_date=" + c_start_date + ", c_end_date=" + c_end_date + ", prof_name=" + prof_name
				+ ", stu_count=" + stu_count + ", c_time=" + c_time + ", c_info=" + c_info + ", c_term=" + c_term
				+ ", c_day=" + c_day + "]";
	}
	

}
