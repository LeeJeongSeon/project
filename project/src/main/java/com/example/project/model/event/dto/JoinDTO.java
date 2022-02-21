package com.example.project.model.event.dto;

public class JoinDTO {
	private int ej_num;
	private String ej_userid;
	private int ej_people;
	private int e_join_p;

	@Override
	public String toString() {
		return "JoinDTO [ej_num=" + ej_num + ", ej_userid=" + ej_userid + ", ej_people=" + ej_people + ", e_join_p="
				+ e_join_p + "]";
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

	public int getEj_people() {
		return ej_people;
	}

	public void setEj_people(int ej_people) {
		this.ej_people = ej_people;
	}

	public int getE_join_p() {
		return e_join_p;
	}

	public void setE_join_p(int e_join_p) {
		this.e_join_p = e_join_p;
	}
}
