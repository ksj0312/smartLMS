package com.smart.lms.vo;

import java.sql.Timestamp;

public class NoteVO {
	private int n_number;
	private String n_sender;
	private String n_reciver;
	private String n_title;
	private String n_info;
	private Timestamp n_send_date;
	private Timestamp n_recive_date;
	
	public int getN_number() {
		return n_number;
	}
	public void setN_number(int n_number) {
		this.n_number = n_number;
	}
	public String getN_sender() {
		return n_sender;
	}
	public void setN_sender(String n_sender) {
		this.n_sender = n_sender;
	}
	public String getN_reciver() {
		return n_reciver;
	}
	public void setN_reciver(String n_reciver) {
		this.n_reciver = n_reciver;
	}
	public String getN_title() {
		return n_title;
	}
	public void setN_title(String n_title) {
		this.n_title = n_title;
	}
	public String getN_info() {
		return n_info;
	}
	public void setN_info(String n_info) {
		this.n_info = n_info;
	}
	public Timestamp getN_send_date() {
		return n_send_date;
	}
	public void setN_send_date(Timestamp n_send_date) {
		this.n_send_date = n_send_date;
	}
	public Timestamp getN_recive_date() {
		return n_recive_date;
	}
	public void setN_recive_date(Timestamp n_recive_date) {
		this.n_recive_date = n_recive_date;
	}
	
	@Override
	public String toString() {
		return "NoteVO [n_number=" + n_number + ", n_sender=" + n_sender + ", n_reciver=" + n_reciver + ", n_title="
				+ n_title + ", n_info=" + n_info + ", n_send_date=" + n_send_date + ", n_recive_date=" + n_recive_date
				+ "]";
	}
	
}
