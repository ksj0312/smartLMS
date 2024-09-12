package com.smart.lms.vo;

import java.sql.Timestamp;

public class CalendarVO {
	private Timestamp cal_date;
	private String cal_title;
	private String cal_info;
	private Timestamp cal_create_date;
	private Timestamp cal_modify_date;
	private String cal_writer;
	
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
	@Override
	public String toString() {
		return "Calendar [cal_date=" + cal_date + ", cal_title=" + cal_title + ", cal_info=" + cal_info
				+ ", cal_create_date=" + cal_create_date + ", cal_modify_date=" + cal_modify_date + ", cal_writer="
				+ cal_writer + "]";
	}
	

}
