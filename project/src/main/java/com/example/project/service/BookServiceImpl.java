package com.example.project.service;

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
	public int countArticle(String search_option, String keyword) throws Exception {
		return bookDao.countArticle(search_option,keyword);
	}

	@Override
	public List<bookDTO> listAll(String search_option, String keyword, int start, int end) {
		return bookDao.listAll(search_option, keyword, start, end);
	}

	@Override
	public bookDTO read(int book_id) {
		return bookDao.read(book_id);
	}

	@Override
	public List<bookDTO> list_checkbox(book_check check) {
		return bookDao.list_checkbox(check);
	}

	
}
