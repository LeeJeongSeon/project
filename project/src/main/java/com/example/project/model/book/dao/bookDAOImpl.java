package com.example.project.model.book.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.project.model.book.VO.book_check;
import com.example.project.model.book.dto.bookDTO;

import ch.qos.logback.core.subst.Token.Type;

@Repository
public class bookDAOImpl implements bookDAO {
	@Inject
	SqlSession sqlSession;

	@Override
	public int countArticle(String search_option, String keyword,book_check check) {
		Map<String,Object> map=new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", "%"+keyword+"%");
		map.put("checklist", check.getChecklist());
		return sqlSession.selectOne("book.countArticle",map);
	}

	@Override
	public bookDTO read(int book_id) {
		return sqlSession.selectOne("book.read", book_id);
	}

	@Override
	public List<bookDTO> list_checkbox(book_check check) {
		return sqlSession.selectList("book.check",check);
	}

	@Override
	public List<bookDTO> listAll(String search_option, String keyword, int start, int end, book_check check) {
		Map<String,Object> map=new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", "%"+keyword+"%");
		map.put("start", start);
		map.put("end", end);
		map.put("checklist", check.getChecklist());
		return sqlSession.selectList("book.listAll", map);
	}

	@Override
	public List<bookDTO> popularity_listAll(int start, int end, book_check check) {
		Map<String,Object> map=new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		map.put("checklist", check.getChecklist());
		return sqlSession.selectList("book.popularity_listAll",map);
	}

	@Override
	public void insertBook(bookDTO dto) {
		sqlSession.selectList("book.book_insert",dto);
	}

	@Override
	public void updateBook(bookDTO dto) {
		sqlSession.update("book.book_update",dto);
		
	}

	@Override
	public void deleteBook(int book_id) {
		sqlSession.delete("book.book_delete",book_id);
		
	}

	@Override
	public List<bookDTO> book_random_recommend(String userid) {
		return sqlSession.selectList("book.random_recommend",userid);
	}

	@Override
	public List<bookDTO> book_other_recommend(String userid) {
		List<String> list=sqlSession.selectList("book.other_recommend",userid);
		return sqlSession.selectList("book.other_recommend2",list);
	}

	@Override
	public List<bookDTO> book_index() {
		return sqlSession.selectList("book.book_index");
	}

	@Override
	public void book_increase(int book_id) {
		sqlSession.update("book.book_increase",book_id);
		
	}

	@Override
	public void update(int book_id) {
		sqlSession.update("book.update",book_id);
		
	}


	
	
}
