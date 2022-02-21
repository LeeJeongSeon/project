package com.example.project.model.book.dto;

import java.util.Arrays;

public class hopeBookDTO {
	private int hopeBook_id; 
	private String hopeBook_title;
	private String hopeBook_bookname;
	private String hopeBook_author;
	private String hopeBook_userid;
	private String hopeBook_content;
	private int ref;
	private int re_step;
	private int re_level;
	private String name; //join해서 받아올 속성 
	private String userid;
	private String filename;
	
	public hopeBookDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	


	@Override
	public String toString() {
		return "hopeBookDTO [hopeBook_id=" + hopeBook_id + ", hopeBook_title=" + hopeBook_title + ", hopeBook_bookname="
				+ hopeBook_bookname + ", hopeBook_author=" + hopeBook_author + ", hopeBook_userid=" + hopeBook_userid
				+ ", hopeBook_content=" + hopeBook_content + ", ref=" + ref + ", re_step=" + re_step + ", re_level="
				+ re_level + ", name=" + name + ", userid=" + userid + ", filename=" + filename + "]";
	}




	public String getFilename() {
		return filename;
	}




	public void setFilename(String filename) {
		this.filename = filename;
	}




	public int getRef() {
		return ref;
	}


	public void setRef(int ref) {
		this.ref = ref;
	}


	public int getRe_step() {
		return re_step;
	}


	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}


	public int getRe_level() {
		return re_level;
	}


	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}


	public int getHopeBook_id() {
		return hopeBook_id;
	}
	public void setHopeBook_id(int hopeBook_id) {
		this.hopeBook_id = hopeBook_id;
	}
	public String getHopeBook_title() {
		return hopeBook_title;
	}
	public void setHopeBook_title(String hopeBook_title) {
		this.hopeBook_title = hopeBook_title;
	}
	public String getHopeBook_bookname() {
		return hopeBook_bookname;
	}
	public void setHopeBook_bookname(String hopeBook_bookname) {
		this.hopeBook_bookname = hopeBook_bookname;
	}
	public String getHopeBook_author() {
		return hopeBook_author;
	}
	public void setHopeBook_author(String hopeBook_author) {
		this.hopeBook_author = hopeBook_author;
	}
	public String getHopeBook_userid() {
		return hopeBook_userid;
	}
	public void setHopeBook_userid(String hopeBook_userid) {
		this.hopeBook_userid = hopeBook_userid;
	}
	public String getHopeBook_content() {
		return hopeBook_content;
	}
	public void setHopeBook_content(String hopeBook_content) {
		this.hopeBook_content = hopeBook_content;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}


	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	
	
	
	
	
}
