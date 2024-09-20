package com.smart.lms.vo;

public class AttendClassVO {
	private int c_number;
	private String id;
	private String name;
	private int attendance;
	private int tardy;
	private int early;
	private int absent;
	
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
	
	@Override
	public String toString() {
		return "AttendClassVO [c_number=" + c_number + ", id=" + id + ", name=" + name + ", attendance=" + attendance
				+ ", tardy=" + tardy + ", early=" + early + ", absent=" + absent + "]";
	}

	
	
	
}
