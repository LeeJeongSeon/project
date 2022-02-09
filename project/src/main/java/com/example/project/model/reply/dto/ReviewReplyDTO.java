package com.example.project.model.reply.dto;

import java.util.Date;

public class ReviewReplyDTO {
	
	private int review_rno; //리뷰 댓글 번호
	private int review_bno; //리뷰글 번호
	private String review_replytext; //리뷰 댓글 내용
	private String review_replyer; //리뷰 댓글 작성자 id
	private Date review_regdate;//작성일자
	private Date review_updatedate; //수정일자
	private String review_secret_reply; //비밀댓글 여부
	private String review_writer; //member 테이블의 id
	
	
	//getter,setter,toString()
	
	public int getReview_rno() {
		return review_rno;
	}
	public void setReview_rno(int review_rno) {
		this.review_rno = review_rno;
	}
	public int getReview_bno() {
		return review_bno;
	}
	public void setReview_bno(int review_bno) {
		this.review_bno = review_bno;
	}
	public String getReview_replytext() {
		return review_replytext;
	}
	public void setReview_replytext(String review_replytext) {
		this.review_replytext = review_replytext;
	}
	public String getReview_replyer() {
		return review_replyer;
	}
	public void setReview_replyer(String review_replyer) {
		this.review_replyer = review_replyer;
	}
	public Date getReview_regdate() {
		return review_regdate;
	}
	public void setReview_regdate(Date review_regdate) {
		this.review_regdate = review_regdate;
	}
	public Date getReview_updatedate() {
		return review_updatedate;
	}
	public void setReview_updatedate(Date review_updatedate) {
		this.review_updatedate = review_updatedate;
	}
	public String getReview_secret_reply() {
		return review_secret_reply;
	}
	public void setReview_secret_reply(String review_secret_reply) {
		this.review_secret_reply = review_secret_reply;
	}
	public String getReview_writer() {
		return review_writer;
	}
	public void setReview_writer(String review_writer) {
		this.review_writer = review_writer;
	}
	
	
	
	
	@Override
	public String toString() {
		return "Review_replyDTO [review_rno=" + review_rno + ", review_bno=" + review_bno + ", review_replytext="
				+ review_replytext + ", review_replyer=" + review_replyer + ", review_regdate=" + review_regdate
				+ ", review_updatedate=" + review_updatedate + ", review_secret_reply=" + review_secret_reply
				+ ", review_writer=" + review_writer + "]";
	}
	


}
