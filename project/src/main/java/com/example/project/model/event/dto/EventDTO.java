package com.example.project.model.event.dto;

public class EventDTO {
	private int e_num;
	private String e_email;
	private String e_agency;
	private String e_instr;
	private String e_name;
	private String e_intro;
	private String e_start_d;
	private String e_start_t;
	private String e_finish_d;
	private String e_place;
	private int e_read_cnt;
	private int e_result;
	private int e_join_p;
	private int e_max_p;
	private int e_genre;
	private int e_reply_cnt;
	private int e_days;

	@Override
	public String toString() {
		return "EventDTO [e_num=" + e_num + ", e_email=" + e_email + ", e_agency=" + e_agency + ", e_instr=" + e_instr
				+ ", e_name=" + e_name + ", e_intro=" + e_intro + ", e_start_d=" + e_start_d + ", e_start_t="
				+ e_start_t + ", e_finish_d=" + e_finish_d + ", e_place=" + e_place + ", e_read_cnt=" + e_read_cnt
				+ ", e_result=" + e_result + ", e_join_p=" + e_join_p + ", e_max_p=" + e_max_p + ", e_genre=" + e_genre
				+ ", e_reply_cnt=" + e_reply_cnt + ", e_days=" + e_days + "]";
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
		return e_intro.replace("\n", "<br>");
	}

	public void setE_intro(String e_intro) {
		this.e_intro = e_intro;
	}

	public String getE_start_d() {
		return e_start_d;
	}

	public void setE_start_d(String e_start_d) {
		this.e_start_d = e_start_d.substring(0, 10);
	}

	public String getE_start_t() {
		return e_start_t;
	}

	public void setE_start_t(String e_start_t) {
		this.e_start_t = e_start_t;
	}

	public String getE_finish_d() {
		return e_finish_d;
	}

	public void setE_finish_d(String e_finish_d) {
		this.e_finish_d = e_finish_d.substring(0, 10);
	}

	public String getE_place() {
		return e_place;
	}

	public void setE_place(String e_place) {
		this.e_place = e_place;
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

	public int getE_join_p() {
		return e_join_p;
	}

	public void setE_join_p(int e_join_p) {
		this.e_join_p = e_join_p;
	}

	public int getE_max_p() {
		return e_max_p;
	}

	public void setE_max_p(int e_max_p) {
		this.e_max_p = e_max_p;
	}

	public int getE_genre() {
		return e_genre;
	}

	public void setE_genre(int e_genre) {
		this.e_genre = e_genre;
	}

	public int getE_reply_cnt() {
		return e_reply_cnt;
	}

	public void setE_reply_cnt(int e_reply_cnt) {
		this.e_reply_cnt = e_reply_cnt;
	}

	public int getE_days() {
		int start=Integer.parseInt(e_start_d.substring(8, 10));
		int end=Integer.parseInt(e_finish_d.substring(8, 10));
		int s_month=Integer.parseInt(e_start_d.substring(5, 7));
		int days=end-start+1;
		if(!(days>0)) {
			if(s_month%2==1) {
				start-=31;
			} else {
				if(s_month==2) {
					start-=28;
				}else {
					start-=30;
				}
			}
		}
		days=end-start+1;
		return days;
	}
}
