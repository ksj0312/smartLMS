package com.smart.lms.vo;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

public class BoardVO {
	private int b_rownum;
	private int b_number;
	private String b_title;
	private String b_info;
	private String b_id;
	private String b_name;
	private Timestamp b_create_date;
	private Timestamp b_modify_date;
	private int b_view;
	private String b_type;
	private String b_file1;
	private String b_file2;
	private String b_file3;
	
	
	private MultipartFile uploadFile;

	
	
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public int getB_number() {
		return b_number;
	}
	public void setB_number(int b_number) {
		this.b_number = b_number;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_info() {
		return b_info;
	}
	public void setB_info(String b_info) {
		this.b_info = b_info;
	}
	public String getB_id() {
		return b_id;
	}
	public void setB_id(String b_id) {
		this.b_id = b_id;
	}
	public String getB_name() {
		return b_name;
	}
	public void setB_name(String b_name) {
		this.b_name = b_name;
	}
	public Timestamp getB_create_date() {
		return b_create_date;
	}
	public void setB_create_date(Timestamp b_create_date) {
		this.b_create_date = b_create_date;
	}
	public Timestamp getB_modify_date() {
		return b_modify_date;
	}
	public void setB_modify_date(Timestamp b_modify_date) {
		this.b_modify_date = b_modify_date;
	}
	public int getB_view() {
		return b_view;
	}
	public void setB_view(int b_view) {
		this.b_view = b_view;
	}
	public String getB_type() {
		return b_type;
	}
	public void setB_type(String b_type) {
		this.b_type = b_type;
	}
	public String getB_file1() {
		return b_file1;
	}
	public void setB_file1(String b_file1) {
		this.b_file1 = b_file1;
	}
	public String getB_file2() {
		return b_file2;
	}
	public void setB_file2(String b_file2) {
		this.b_file2 = b_file2;
	}
	public String getB_file3() {
		return b_file3;
	}
	public void setB_file3(String b_file3) {
		this.b_file3 = b_file3;
	}
	
	public int getB_rownum() {
		return b_rownum;
	}
	public void setB_rownum(int b_rownum) {
		this.b_rownum = b_rownum;
	}
	@Override
	public String toString() {
		return "BoardVO [b_rownum=" + b_rownum + ", b_number=" + b_number + ", b_title=" + b_title + ", b_info="
				+ b_info + ", b_id=" + b_id + ", b_name=" + b_name + ", b_create_date=" + b_create_date
				+ ", b_modify_date=" + b_modify_date + ", b_view=" + b_view + ", b_type=" + b_type + ", b_file1="
				+ b_file1 + ", b_file2=" + b_file2 + ", b_file3=" + b_file3 + ", uploadFile=" + uploadFile + "]";
	}

	


}
