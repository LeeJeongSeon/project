package com.example.project.service.book;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.project.model.book.dao.hopeBookDAO;
import com.example.project.model.book.dto.bookDTO;
import com.example.project.model.book.dto.hopeBookDTO;

@Service
public class HopeBookServiceImpl implements HopeBookService {

	@Inject
	hopeBookDAO hopeBookDao;
	
	@Override
	public int countArticle(String search_option, String keyword) throws Exception {
		return hopeBookDao.countArticle(search_option, keyword);
	}

	@Override
	public List<hopeBookDTO> listAll(String search_option, String keyword, int start, int end) {
		return hopeBookDao.listAll(search_option, keyword, start, end);
	}

	@Override
	public void insertBook(hopeBookDTO dto) {
		hopeBookDao.insertBook(dto);
	}

	@Override
	public hopeBookDTO read(int hopeBook_id) {
		return hopeBookDao.read(hopeBook_id);
	}

	@Override
	public void updateStep(int ref, int re_step) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void reply(hopeBookDTO dto) {
		hopeBookDao.reply(dto);
		
	}

	@Override
	public int ref(int ref) {
		return hopeBookDao.ref(ref);
	}

	@Override
	public String check(String hopeBook_author, String hopeBook_bookname) {
		return hopeBookDao.check(hopeBook_author,hopeBook_bookname);
	}

	@Override
	public List<hopeBookDTO> view(int hopeBook_id) {
		return hopeBookDao.view(hopeBook_id);
	}

}
