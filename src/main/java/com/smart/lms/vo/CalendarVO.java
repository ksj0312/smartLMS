package com.smart.lms.vo;

import java.sql.Timestamp;

public class CalendarVO {
	
	private String cal_color;
	private int cal_number;
	private Timestamp cal_date;
	private String cal_title;
	private String cal_info;
	private Timestamp cal_create_date;
	private Timestamp cal_modify_date;
	private String cal_writer;
	private Timestamp cal_edate;
	
	
	
	
	public Timestamp getCal_edate() {
		return cal_edate;
	}
	public void setCal_edate(Timestamp cal_edate) {
		this.cal_edate = cal_edate;
	}
	public Timestamp getCal_date() {
		return cal_date;
	}
	public void setCal_date(Timestamp cal_date) {
		this.cal_date = cal_date;
	}
	public String getCal_title() {
		return cal_title;
	}
	public void setCal_title(String cal_title) {
		this.cal_title = cal_title;
	}
	public String getCal_info() {
		return cal_info;
	}
	public void setCal_info(String cal_info) {
		this.cal_info = cal_info;
	}
	public Timestamp getCal_create_date() {
		return cal_create_date;
	}
	public void setCal_create_date(Timestamp cal_create_date) {
		this.cal_create_date = cal_create_date;
	}
	public Timestamp getCal_modify_date() {
		return cal_modify_date;
	}
	public void setCal_modify_date(Timestamp cal_modify_date) {
		this.cal_modify_date = cal_modify_date;
	}
	public String getCal_writer() {
		return cal_writer;
	}
	public void setCal_writer(String cal_writer) {
		this.cal_writer = cal_writer;
	}
	public int getCal_number() {
		return cal_number;
	}
	public void setCal_number(int cal_number) {
		this.cal_number = cal_number;
	}
	public String getCal_color() {
		return cal_color;
	}
	public void setCal_color(String cal_color) {
		this.cal_color = cal_color;
	}
	@Override
	public String toString() {
		return "CalendarVO [cal_color=" + cal_color + ", cal_number=" + cal_number + ", cal_date=" + cal_date
				+ ", cal_title=" + cal_title + ", cal_info=" + cal_info + ", cal_create_date=" + cal_create_date
				+ ", cal_modify_date=" + cal_modify_date + ", cal_writer=" + cal_writer + ", cal_edate=" + cal_edate
				+ "]";
	}
	
	
	
	
	

}
