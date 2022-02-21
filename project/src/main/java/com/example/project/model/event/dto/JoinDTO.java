package com.example.project.model.event.dto;

public class JoinDTO {
	private int ej_num;
	private String ej_userid;
	private String ej_name;
	private String ej_instr;
	private int ej_genre;
	private int ej_people;
	private int ej_join_p;
	private int ej_max_p;

	@Override
	public String toString() {
		return "JoinDTO [ej_num=" + ej_num + ", ej_userid=" + ej_userid + ", ej_name=" + ej_name + ", ej_instr="
				+ ej_instr + ", ej_genre=" + ej_genre + ", ej_people=" + ej_people + ", ej_join_p=" + ej_join_p
				+ ", ej_max_p=" + ej_max_p + "]";
	}

	public int getEj_num() {
		return ej_num;
	}

	public void setEj_num(int ej_num) {
		this.ej_num = ej_num;
	}

	public String getEj_userid() {
		return ej_userid;
	}

	public void setEj_userid(String ej_userid) {
		this.ej_userid = ej_userid;
	}

	public String getEj_name() {
		return ej_name;
	}

	public void setEj_name(String ej_name) {
		this.ej_name = ej_name;
	}

	public String getEj_instr() {
		return ej_instr;
	}

	public void setEj_instr(String ej_instr) {
		this.ej_instr = ej_instr;
	}

	public int getEj_genre() {
		return ej_genre;
	}

	public void setEj_genre(int ej_genre) {
		this.ej_genre = ej_genre;
	}

	public int getEj_people() {
		return ej_people;
	}

	public void setEj_people(int ej_people) {
		this.ej_people = ej_people;
	}

	public int getEj_join_p() {
		return ej_join_p;
	}

	public void setEj_join_p(int ej_join_p) {
		this.ej_join_p = ej_join_p;
	}

	public int getEj_max_p() {
		return ej_max_p;
	}

	public void setEj_max_p(int ej_max_p) {
		this.ej_max_p = ej_max_p;
	}
}
