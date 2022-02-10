package com.example.project.model.review.dao;

import java.util.List;

import com.example.project.model.review.dto.ReviewDTO;

public interface ReviewDAO {
	
	public void deleteFile(String review_fullName); //첨부파일 삭제
	
	public List<String> getAttach(int review_bno); //첨부파일 정보
	
	public void addAttach(String review_fullName); //첨부파일 저장
	
	public void updateAttach(String review_fullName, int review_bno);//첨부파일 수정
	
	public void create(ReviewDTO dto) throws Exception;//글쓰기
	
	public void update(ReviewDTO dto) throws Exception;//글수정
	
	public void delete(int review_bno) throws Exception;//글삭제
	
	public List<ReviewDTO> listAll(String search_option, String keyword, int start, int end) throws Exception;//글목록
	
	public void increaseViewcnt(int review_bno) throws Exception;//조회수 증가 처리
	
	public int countArticle(String search_option, String keyword) throws Exception;//레코드 갯수 계산
	
	public ReviewDTO read(int review_bno) throws Exception;//레코드 조회

}
