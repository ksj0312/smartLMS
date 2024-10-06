package com.smart.lms.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;


public class TestVO {

	private int g_number;
	private int c_number;
	private String id;
	private String test_type;
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
	private Date start_time;
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
	private Date end_time;
	private String test_time;
	private int status;
	
	public int getG_number() {
		return g_number;
	}
	public void setG_number(int g_number) {
		this.g_number = g_number;
	}
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
	public String getTest_type() {
		return test_type;
	}
	public void setTest_type(String test_type) {
		this.test_type = test_type;
	}
	public Date getStart_time() {
		return start_time;
	}
	public void setStart_time(Date start_time) {
		this.start_time = start_time;
	}
	public Date getEnd_time() {
		return end_time;
	}
	public void setEnd_time(Date end_time) {
		this.end_time = end_time;
	}
	public String getTest_time() {
		return test_time;
	}
	public void setTest_time(String test_time) {
		this.test_time = test_time;
	}
	@Override
	public String toString() {
		return "TestVO [g_number=" + g_number + ", c_number=" + c_number + ", id=" + id + ", test_type=" + test_type
				+ ", start_time=" + start_time + ", end_time=" + end_time + ", test_time=" + test_time + "]";
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
}
