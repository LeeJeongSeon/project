package com.example.project.model.book.dao;

import java.util.List;

import com.example.project.model.book.dto.bookDTO;
import com.example.project.model.book.dto.hopeBookDTO;

public interface hopeBookDAO {
	public int countArticle(String search_option, String keyword) throws Exception;//레코드 갯수 계산
	public List<hopeBookDTO> listAll(String search_option, String keyword, int start, int end); //list
	public void insertBook(hopeBookDTO dto); //게시판추가
	public hopeBookDTO read(int hopeBook_id); //읽기
	public void reply(hopeBookDTO dto);
	public int ref(int ref);
	public String check(String hopeBook_author, String hopeBook_bookname);
	public List<hopeBookDTO> view(int hopeBook_id);
}
