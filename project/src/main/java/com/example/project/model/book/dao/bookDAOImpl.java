package com.example.project.model.book.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.project.model.book.VO.book_check;
import com.example.project.model.book.dto.bookDTO;

@Repository
public class bookDAOImpl implements bookDAO {
	@Inject
	SqlSession sqlSession;

	@Override
	public int countArticle(String search_option, String keyword) {
		Map<String,String> map=new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", "%"+keyword+"%");
		return sqlSession.selectOne("book.countArticle",map);
	}

	@Override
	public List<bookDTO> listAll(String search_option, String keyword, int start, int end) {
		Map<String,Object> map=new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", "%"+keyword+"%");
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("book.listAll", map);
	}

	@Override
	public bookDTO read(int book_id) {
		return sqlSession.selectOne("book.read", book_id);
	}

	@Override
	public List<bookDTO> list_checkbox(book_check check) {
		return sqlSession.selectList("book.check",check);
	}
	
	
}
