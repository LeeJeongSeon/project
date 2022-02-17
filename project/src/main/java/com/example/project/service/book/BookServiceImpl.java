package com.example.project.service.book;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.project.model.book.VO.book_check;
import com.example.project.model.book.dao.bookDAO;
import com.example.project.model.book.dto.bookDTO;
import com.example.project.model.rent.DTO.RentDTO;

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

	@Override
	public void updateBook(bookDTO dto) {
		bookDao.updateBook(dto);
	}

	@Override
	public void deleteBook(int book_id) {
		bookDao.deleteBook(book_id);
		
	}

	@Override
	public List<bookDTO> book_random_recommend(String userid) {
		return bookDao.book_random_recommend(userid); 
	}

	@Override
	public List<bookDTO> book_other_recommend(String userid) {
		return bookDao.book_other_recommend(userid);
	}

	@Override
	public List<bookDTO> book_index() {
		return bookDao.book_index();
	}

	@Override
	public void book_increase(int book_id) {
		bookDao.book_increase(book_id);
		
	}

	@Override
	public void update(int book_id) {
		bookDao.update(book_id);
		
	}





	
}
