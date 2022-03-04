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
	
	//레코드 갯수 계산
	@Override
	public int countArticle(String search_option, String keyword,book_check check) throws Exception {
		return bookDao.countArticle(search_option,keyword,check);
	}

	//도서상세페이지
	@Override
	public bookDTO read(int book_id) {
		return bookDao.read(book_id);
	}

	//체크박스
	@Override
	public List<bookDTO> list_checkbox(book_check check) {
		return bookDao.list_checkbox(check);
	}

	//도서목록
	@Override
	public List<bookDTO> listAll(String search_option, String keyword, int start, int end, book_check check) {
		return bookDao.listAll(search_option, keyword, start, end,check);
	}

	//도서 인기순 정렬
	@Override
	public List<bookDTO> popularity_listAll(book_check check) {
		return bookDao.popularity_listAll(check);
	}

	//도서추가
	@Override
	public void insertBook(bookDTO dto) {
		bookDao.insertBook(dto);
		
	}

	//도서수정
	@Override
	public void updateBook(bookDTO dto) {
		bookDao.updateBook(dto);
	}

	//도서삭제
	@Override
	public void deleteBook(int book_id) {
		bookDao.deleteBook(book_id);
		
	}

	//도서 랜덤추천
	@Override
	public List<bookDTO> book_random_recommend(String userid) {
		return bookDao.book_random_recommend(userid); 
	}

	//다른사람의 도서추천
	@Override
	public List<bookDTO> book_other_recommend(String userid) {
		return bookDao.book_other_recommend(userid);
	}

	//도서메인페이지
	@Override
	public List<bookDTO> book_index() {
		return bookDao.book_index();
	}

	//대출수 증가, 대출중 체크
	@Override
	public void book_increase(int book_id) {
		bookDao.book_increase(book_id);
		
	}

	//대출가능 체크
	@Override
	public void update(int book_id) {
		bookDao.update(book_id);
		
	}

	//청구기호 부여
	@Override
	public String create_callName(String book_genre,String book_author) {
		return bookDao.create_callName(book_genre,book_author);
	}





	
}
