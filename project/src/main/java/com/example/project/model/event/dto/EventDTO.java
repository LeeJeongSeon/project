package com.example.project.model.event.dto;

import java.util.Date;

public class EventDTO {
	private int e_num;
	private String e_email;
	private String e_agency;
	private String e_instr;
	private String e_name;
	private String e_intro;
	private Date e_start_d;
	private Date e_finish_d;
	private int e_read_cnt;
	private int e_result;

	@Override
	public String toString() {
		return "EventDTO [e_num=" + e_num + ", e_email=" + e_email + ", e_agency=" + e_agency + ", e_instr=" + e_instr
				+ ", e_name=" + e_name + ", e_intro=" + e_intro + ", e_start_d=" + e_start_d + ", e_finish_d="
				+ e_finish_d + ", e_read_cnt=" + e_read_cnt + ", e_result=" + e_result + "]";
	}

	public int getE_num() {
		return e_num;
	}

	public void setE_num(int e_num) {
		this.e_num = e_num;
	}

	public String getE_email() {
		return e_email;
	}
	
	public void setE_email(String e_email) {
		this.e_email = e_email;
	}
	
	public String getE_agency() {
		return e_agency;
	}

	public void setE_agency(String e_agency) {
		this.e_agency = e_agency;
	}
	
	public String getE_instr() {
		return e_instr;
	}
	
	public void setE_instr(String e_instr) {
		this.e_instr = e_instr;
	}

	public String getE_name() {
		return e_name;
	}

	public void setE_name(String e_name) {
		this.e_name = e_name;
	}

	public String getE_intro() {
		return e_intro;
	}

	public void setE_intro(String e_intro) {
		this.e_intro = e_intro;
	}

	public Date getE_start_d() {
		return e_start_d;
	}

	public void setE_start_d(Date e_start_d) {
		this.e_start_d = e_start_d;
	}

	public Date getE_finish_d() {
		return e_finish_d;
	}

	public void setE_finish_d(Date e_finish_d) {
		this.e_finish_d = e_finish_d;
	}

	public int getE_read_cnt() {
		return e_read_cnt;
	}

	public void setE_read_cnt(int e_read_cnt) {
		this.e_read_cnt = e_read_cnt;
	}

	public int getE_result() {
		return e_result;
	}

	public void setE_result(int e_result) {
		this.e_result = e_result;
	}
}
