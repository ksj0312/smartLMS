package com.smart.lms.vo;

import java.sql.Timestamp;

public class StuTaskVO {
	private int st_number;
	private int t_number;
	private int c_number;
	private String id;
	private String st_status;
	private String st_submit;
	private int st_score;
	private int st_total_score;
	private Timestamp st_cteate_date;
	private Timestamp st_modify_date;
	private String t_file1;
	private String t_file2;
	private String t_file3;
	
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
	public String getT_file1() {
		return t_file1;
	}
	public void setT_file1(String t_file1) {
		this.t_file1 = t_file1;
	}
	public String getT_file2() {
		return t_file2;
	}
	public void setT_file2(String t_file2) {
		this.t_file2 = t_file2;
	}
	public String getT_file3() {
		return t_file3;
	}
	public void setT_file3(String t_file3) {
		this.t_file3 = t_file3;
	}
	
	@Override
	public String toString() {
		return "StuTaskVO [st_number=" + st_number + ", t_number=" + t_number + ", c_number=" + c_number + ", id=" + id
				+ ", st_status=" + st_status + ", st_submit=" + st_submit + ", st_score=" + st_score
				+ ", st_total_score=" + st_total_score + ", st_cteate_date=" + st_cteate_date + ", st_modify_date="
				+ st_modify_date + ", t_file1=" + t_file1 + ", t_file2=" + t_file2 + ", t_file3=" + t_file3 + "]";
	}
	
}
