package com.smart.lms.vo;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

public class StuTaskVO {
	private int st_number;
	private int t_number;
	private int c_number;
	private String id;
	private String name;
	private String st_status;
	private String st_submit;
	private int st_score;
	private int st_total_score;
	private String st_title;
	private String st_info;
	private Timestamp st_cteate_date;
	private Timestamp st_modify_date;
	private String s_file1;
	private String s_file2;
	private String s_file3;
	
	
	private MultipartFile uploadFile;
	
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSt_title() {
		return st_title;
	}
	public void setSt_title(String st_title) {
		this.st_title = st_title;
	}
	public String getSt_info() {
		return st_info;
	}
	public void setSt_info(String st_info) {
		this.st_info = st_info;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public int getSt_number() {
		return st_number;
	}
	public void setSt_number(int st_number) {
		this.st_number = st_number;
	}
	public int getT_number() {
		return t_number;
	}
	public void setT_number(int t_number) {
		this.t_number = t_number;
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
	public String getSt_status() {
		return st_status;
	}
	public void setSt_status(String st_status) {
		this.st_status = st_status;
	}
	public String getSt_submit() {
		return st_submit;
	}
	public void setSt_submit(String st_submit) {
		this.st_submit = st_submit;
	}
	public int getSt_score() {
		return st_score;
	}
	public void setSt_score(int st_score) {
		this.st_score = st_score;
	}
	public int getSt_total_score() {
		return st_total_score;
	}
	public void setSt_total_score(int st_total_score) {
		this.st_total_score = st_total_score;
	}
	public Timestamp getSt_cteate_date() {
		return st_cteate_date;
	}
	public void setSt_cteate_date(Timestamp st_cteate_date) {
		this.st_cteate_date = st_cteate_date;
	}
	public Timestamp getSt_modify_date() {
		return st_modify_date;
	}
	public void setSt_modify_date(Timestamp st_modify_date) {
		this.st_modify_date = st_modify_date;
	}
	public String getS_file1() {
		return s_file1;
	}
	public void setS_file1(String s_file1) {
		this.s_file1 = s_file1;
	}
	public String getS_file2() {
		return s_file2;
	}
	public void setS_file2(String s_file2) {
		this.s_file2 = s_file2;
	}
	public String getS_file3() {
		return s_file3;
	}
	public void setS_file3(String s_file3) {
		this.s_file3 = s_file3;
	}
	@Override
	public String toString() {
		return "StuTaskVO [st_number=" + st_number + ", t_number=" + t_number + ", c_number=" + c_number + ", id=" + id
				+ ", st_status=" + st_status + ", st_submit=" + st_submit + ", st_score=" + st_score
				+ ", st_total_score=" + st_total_score + ", st_cteate_date=" + st_cteate_date + ", st_modify_date="
				+ st_modify_date + ", s_file1=" + s_file1 + ", s_file2=" + s_file2 + ", s_file3=" + s_file3
				+ ", uploadFile=" + uploadFile + "]";
	}
	
	
}
