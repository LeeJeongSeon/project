package com.example.project.service.book;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.project.model.book.VO.book_check;
import com.example.project.model.book.dao.bookDAO;
import com.example.project.model.book.dto.bookDTO;

@Service
public class BookServiceImpl implements BookService {

	@Inject
	bookDAO bookDao;
	
	@Override
	public int countArticle(String search_option, String keyword,book_check check) throws Exception {
		return bookDao.countArticle(search_option,keyword,check);
	}

	@Override
	public bookDTO read(int book_id) {
		return bookDao.read(book_id);
	}

	@Override
	public List<bookDTO> list_checkbox(book_check check) {
		return bookDao.list_checkbox(check);
	}

	@Override
	public List<bookDTO> listAll(String search_option, String keyword, int start, int end, book_check check) {
		return bookDao.listAll(search_option, keyword, start, end,check);
	}

	@Override
	public List<bookDTO> popularity_listAll(int start, int end, book_check check) {
		return bookDao.popularity_listAll(start, end,check);
	}

	@Override
	public void insertBook(bookDTO dto) {
		bookDao.insertBook(dto);
		
	}


	
}
