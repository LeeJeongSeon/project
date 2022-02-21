package com.example.project.model.book.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.project.model.book.dto.hopeBookDTO;

@Repository
public class hopeBookDAOImpl implements hopeBookDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public int countArticle(String search_option, String keyword) throws Exception {
		Map<String,Object> map=new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", "%"+keyword+"%");
		return sqlSession.selectOne("hopeBook.countArticle",map);
	}

	@Override
	public List<hopeBookDTO> listAll(String search_option, String keyword, int start, int end) {
		Map<String,Object> map=new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", "%"+keyword+"%");
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("hopeBook.listAll", map);
	}

	@Override
	public void insertBook(hopeBookDTO dto) {
		sqlSession.insert("hopeBook.insertBook", dto);

	}

	@Override
	public hopeBookDTO read(int hopeBook_id) {
		return sqlSession.selectOne("hopeBook.read",hopeBook_id);
	}

	@Override
	public void reply(hopeBookDTO dto) {
		sqlSession.insert("hopeBook.reply",dto);
		
	}

	@Override
	public int ref(int ref) {
		return sqlSession.selectOne("hopeBook.ref",ref);
	}

	@Override
	public String check(String hopeBook_author, String hopeBook_bookname) {
		Map<String,String> map=new HashMap<>();
		map.put("hopeBook_author", hopeBook_author);
		map.put("hopeBook_bookname", hopeBook_bookname);
		//System.out.println("임시:"+hopeBook_bookname+","+hopeBook_author);
		//String result=sqlSession.selectOne("hopeBook.check",map);
		//System.out.println(result);
		
		return sqlSession.selectOne("hopeBook.check",map);
	}

	@Override
	public List<hopeBookDTO> view(int hopeBook_id) {
		return sqlSession.selectList("hopeBook.view",hopeBook_id);
	}


}
