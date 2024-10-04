package com.smart.lms.vo;

import java.sql.Timestamp;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

public class TaskVO {
	private int t_number;
	private int c_number;
	private String id;
	private String title;
	private String info;
	private Timestamp create_date;
	private Timestamp modify_date;
	
//	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
    private Date  deadline;
//    private LocalDateTime  deadline;
	private String t_file1;
	private String t_file2;
	private String t_file3;
	
	private MultipartFile uploadFile;

	
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public Timestamp getCreate_date() {
		return create_date;
	}
	public void setCreate_date(Timestamp create_date) {
		this.create_date = create_date;
	}
	public Timestamp getModify_date() {
		return modify_date;
	}
	public void setModify_date(Timestamp modify_date) {
		this.modify_date = modify_date;
	}
	public Date getDeadline() {
		return deadline;
	}
	public void setDeadline(Date deadline) {
		this.deadline = deadline;
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
		return "TaskVO [t_number=" + t_number + ", c_number=" + c_number + ", id=" + id + ", title=" + title + ", info="
				+ info + ", create_date=" + create_date + ", modify_date=" + modify_date + ", deadline=" + deadline
				+ ", t_file1=" + t_file1 + ", t_file2=" + t_file2 + ", t_file3=" + t_file3 + "]";
	}
	
	
	
}