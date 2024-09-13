package com.smart.lms.vo;

import java.sql.Timestamp;
import java.util.Date;

public class ProfessorVO {
	private String id;
	private String pwd;
	private String name;
	private String gender;
	private String birth;
	private String tel;
	private String zipcode;
	private String addr;
	private String detail_addr;
	private String email;
	private String lesson;
	private Timestamp join_date ;
	private Timestamp modify_date ;
	private String status;
	private Date indate;
	private Date outdate;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getDetail_addr() {
		return detail_addr;
	}
	public void setDetail_addr(String detail_addr) {
		this.detail_addr = detail_addr;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getLesson() {
		return lesson;
	}
	public void setLesson(String lesson) {
		this.lesson = lesson;
	}
	public Timestamp getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Timestamp join_date) {
		this.join_date = join_date;
	}
	public Timestamp getModify_date() {
		return modify_date;
	}
	public void setModify_date(Timestamp modify_date) {
		this.modify_date = modify_date;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getIndate() {
		return indate;
	}
	public void setIndate(Date indate) {
		this.indate = indate;
	}
	public Date getOutdate() {
		return outdate;
	}
	public void setOutdate(Date outdate) {
		this.outdate = outdate;
	}
	
	@Override
	public String toString() {
		return "ProfessorVO [id=" + id + ", pwd=" + pwd + ", name=" + name + ", gender=" + gender + ", birth=" + birth
				+ ", tel=" + tel + ", zipcode=" + zipcode + ", addr=" + addr + ", detail_addr=" + detail_addr
				+ ", email=" + email + ", lesson=" + lesson + ", join_date=" + join_date + ", modify_date="
				+ modify_date + ", status=" + status + ", indate=" + indate + ", outdate=" + outdate + "]";
	}
	
	
	
	
	
}
