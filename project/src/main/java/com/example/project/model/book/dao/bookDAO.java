package com.example.project.model.book.dao;

import java.util.List;

import com.example.project.model.book.VO.book_check;
import com.example.project.model.book.dto.bookDTO;

public interface bookDAO {

	public int countArticle(String search_option, String keyword);

	public List<bookDTO> listAll(String search_option, String keyword, int start, int end);

	public bookDTO read(int book_id);

	public List<bookDTO> list_checkbox(book_check check);

}
