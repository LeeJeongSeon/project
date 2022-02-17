package com.example.project.model.event.dto;

public class ReplyDTO {
	private int er_num;
	private int er_e_num;
	private String er_userid;
	private String er_content;
	private String er_date;
	private int er_change;

	@Override
	public String toString() {
		return "ReplyDTO [er_num=" + er_num + ", er_e_num=" + er_e_num + ", er_userid=" + er_userid + ", er_content="
				+ er_content + ", er_date=" + er_date + ", er_change=" + er_change + "]";
	}

	public int getEr_num() {
		return er_num;
	}

	public void setEr_num(int er_num) {
		this.er_num = er_num;
	}

	public int getEr_e_num() {
		return er_e_num;
	}

	public void setEr_e_num(int er_e_num) {
		this.er_e_num = er_e_num;
	}

	public String getEr_userid() {
		return er_userid;
	}

	public void setEr_userid(String er_userid) {
		this.er_userid = er_userid;
	}

	public String getEr_content() {
		return er_content;
	}

	public void setEr_content(String er_content) {
		this.er_content = er_content;
	}

	public String getEr_date() {
		return er_date;
	}

	public void setEr_date(String er_date) {
		this.er_date = er_date;
	}

	public int getEr_change() {
		return er_change;
	}

	public void setEr_change(int er_change) {
		this.er_change = er_change;
	}
}
