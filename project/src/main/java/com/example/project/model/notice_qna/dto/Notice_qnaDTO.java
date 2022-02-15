package com.example.project.model.notice_qna.dto;

import java.util.Date;

public class Notice_qnaDTO {
	private int num; 
	private String category; 
	private String id; 
	private String subject; 
	private Date reg_date;  
	private int readcount; 
	private String content; 
	private String  filename;
	private String notice;
	private int ref;
	private int ref_step;
	private int re_level;
	
	

	public int getRe_level() {
		return re_level;
	}
	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getRef_step() {
		return ref_step;
	}
	public void setRef_step(int ref_step) {
		this.ref_step = ref_step;
	}

	public String getNotice() {
		return notice;
	}
	public void setNotice(String notice) {
		this.notice = notice;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	@Override
	public String toString() {
		return "Notice_qnaDTO [num=" + num + ", category=" + category + ", id=" + id + ", subject=" + subject
				+ ", reg_date=" + reg_date + ", readcount=" + readcount + ", content=" + content + ", filename="
				+ filename + ", notice=" + notice + ", ref=" + ref + ", ref_step=" + ref_step + ", re_level=" + re_level
				+ "]";
	}
	
	

}
