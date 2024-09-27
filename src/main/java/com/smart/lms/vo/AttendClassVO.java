package com.smart.lms.vo;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class AttendClassVO {
	private int c_number;
	private String id;
	private String name;
	private int attendance;
	private int tardy;
	private int early;
	private int absent;
	
	//출석부 
	private String a_status;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date a_date;
	
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAttendance() {
		return attendance;
	}
	public void setAttendance(int attendance) {
		this.attendance = attendance;
	}
	public int getTardy() {
		return tardy;
	}
	public void setTardy(int tardy) {
		this.tardy = tardy;
	}
	public int getEarly() {
		return early;
	}
	public void setEarly(int early) {
		this.early = early;
	}
	public int getAbsent() {
		return absent;
	}
	public void setAbsent(int absent) {
		this.absent = absent;
	}
	
	public String getA_status() {
		return a_status;
	}
	public void setA_status(String a_status) {
		this.a_status = a_status;
	}
	public Date getA_date() {
		return a_date;
	}
	public void setA_date(Date a_date) {
		this.a_date = a_date;
	}
	@Override
	public String toString() {
		return "AttendClassVO [c_number=" + c_number + ", id=" + id + ", name=" + name + ", attendance=" + attendance
				+ ", tardy=" + tardy + ", early=" + early + ", absent=" + absent + ", a_status=" + a_status
				+ ", a_date=" + a_date + "]";
	}
	
	

	
	
	
}
