package com.example.project.model.review.dto;

import java.util.Arrays;
import java.util.Date;

public class ReviewDTO {
	private int review_bno;//리뷰글 번호
	private String review_title;//리뷰 제목
	private String review_content;//리뷰 본문
	private String review_writer;//리뷰 작성자 id
	private Date review_regdate;//리뷰 작성일자
	private int review_viewcnt;//리뷰글 조회수
	private int review_cnt;//리뷰 댓글 갯수
	private String review_show;//삭제시 화면표시 여부
	private String[] review_files; //리뷰 첨부파일 이름 배열
	
	
	//getter setter와 toString()
	
	public int getReview_bno() {
		return review_bno;
	}
	public void setReview_bno(int review_bno) {
		this.review_bno = review_bno;
	}
	public String getReview_title() {
		return review_title;
	}
	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public String getReview_writer() {
		return review_writer;
	}
	public void setReview_writer(String review_writer) {
		this.review_writer = review_writer;
	}
	public Date getReview_regdate() {
		return review_regdate;
	}
	public void setReview_regdate(Date review_regdate) {
		this.review_regdate = review_regdate;
	}
	public int getReview_viewcnt() {
		return review_viewcnt;
	}
	public void setReview_viewcnt(int review_viewcnt) {
		this.review_viewcnt = review_viewcnt;
	}
	public int getReview_cnt() {
		return review_cnt;
	}
	public void setReview_cnt(int review_cnt) {
		this.review_cnt = review_cnt;
	}
	public String getReview_show() {
		return review_show;
	}
	public void setReview_show(String review_show) {
		this.review_show = review_show;
	}
	public String[] getReview_files() {
		return review_files;
	}
	public void setReview_files(String[] review_files) {
		this.review_files = review_files;
	}
	
	
	
	
	@Override
	public String toString() {
		return "ReviewDTO [review_bno=" + review_bno + ", review_title=" + review_title + ", review_content="
				+ review_content + ", review_writer=" + review_writer + ", review_regdate=" + review_regdate
				+ ", review_viewcnt=" + review_viewcnt + ", review_cnt=" + review_cnt + ", review_show=" + review_show
				+ ", review_files=" + Arrays.toString(review_files) + "]";
	}
	
	
	
	
	
}
