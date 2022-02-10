package com.example.project.model.member.DTO;

import java.util.Date;

public class MemberDTO {
	
	private String userid;// 유저아이디
	private String passwd; //패스워드
	private String name; //유저이름
	private String phone; //유저 전화번호
	private String zipcode; // 우편번호
	private String address1; //주소
	private String address2; //상세주소
	private String email; //이메일
	private Date join_date; //가입일자
	private int adminCk; //관리자 체크
	
	//getter setter 
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}
	public int getAdminCk() {
		return adminCk;
	}
	public void setAdminCk(int adminCk) {
		this.adminCk = adminCk;
	}
	
	
	//to string
	
	@Override
	public String toString() {
		return "MemberDTO [userid=" + userid + ", passwd=" + passwd + ", name=" + name + ", phone=" + phone
				+ ", zipcode=" + zipcode + ", address1=" + address1 + ", address2=" + address2 + ", email=" + email
				+ ", join_date=" + join_date + ", adminCk=" + adminCk + "]";
	}
	
	public MemberDTO() {

	}

	
	
	

	

}
