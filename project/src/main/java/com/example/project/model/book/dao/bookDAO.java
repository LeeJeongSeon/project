package com.example.project.model.book.dao;

import java.util.List;

import com.example.project.model.book.VO.book_check;
import com.example.project.model.book.dto.bookDTO;

public interface bookDAO {
	public int countArticle(String search_option, String keyword, book_check check) throws Exception;//레코드 갯수 계산
	public bookDTO read(int book_id); //상세페이지
	public List<bookDTO> list_checkbox(book_check check);
	public List<bookDTO> listAll(String search_option, String keyword, int start, int end, book_check check); //도서목록
	public void insertBook(bookDTO dto); //도서추가
	public void updateBook(bookDTO dto); //도서수정
	public void deleteBook(int book_id); //도서삭제
	public List<bookDTO> book_random_recommend(String userid); //도서 랜덤추천
	public List<bookDTO> book_other_recommend(String userid); //다른사람의 도서추천
	public List<bookDTO> book_index(); //메인페이지
	public void book_increase(int book_id); //대출횟수증가,대출중체크
	public void update(int book_id); //대출가능차케
	public List<bookDTO> popularity_listAll(book_check check); //인기순정렬
	public String create_callName(String book_genre,String book_author); //청구기호부여


}
