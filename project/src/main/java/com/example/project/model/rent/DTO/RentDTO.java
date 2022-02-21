package com.example.project.model.rent.DTO;

import java.util.Date;

public class RentDTO {
	private int bnum;
	private String userid;
	private String name;
	private int book_id;
	private String book_name;
	private Date aday;
	private Date bday;
	private int rent_check;
	private String show;
	
	public int getBnum() {
		return bnum;
	}
	public void setBnum(int bnum) {
		this.bnum = bnum;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getBook_id() {
		return book_id;
	}
	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public Date getAday() {
		return aday;
	}
	public void setAday(Date aday) {
		this.aday = aday;
	}
	public Date getBday() {
		return bday;
	}
	public void setBday(Date bday) {
		this.bday = bday;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getRent_check() {
		return rent_check;
	}
	public void setRent_check(int rent_check) {
		this.rent_check = rent_check;
	}
	public String getShow() {
		return show;
	}
	public void setShow(String show) {
		this.show = show;
	}
	
	@Override
	public String toString() {
		return "RentDTO [bnum=" + bnum + ", userid=" + userid + ", name=" + name + ", book_id=" + book_id
				+ ", book_name=" + book_name + ", aday=" + aday + ", bday=" + bday + ", rent_check=" + rent_check
				+ ", show=" + show + "]";
	}
}
