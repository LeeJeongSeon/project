package com.example.project.service.book;

import java.util.List;

import com.example.project.model.book.VO.book_check;
import com.example.project.model.book.dto.bookDTO;

public interface BookService {
	public int countArticle(String search_option, String keyword, book_check check) throws Exception;//레코드 갯수 계산

	public bookDTO read(int book_id);

	public List<bookDTO> list_checkbox(book_check check);

	public List<bookDTO> listAll(String search_option, String keyword, int start, int end, book_check check);

	public List<bookDTO> popularity_listAll(int start, int end, book_check check);

	public void insertBook(bookDTO dto);

	public void updateBook(bookDTO dto);

	public void deleteBook(int book_id);

	public List<bookDTO> book_random_recommend(String userid);

	public List<bookDTO> book_other_recommend(String userid);
}
