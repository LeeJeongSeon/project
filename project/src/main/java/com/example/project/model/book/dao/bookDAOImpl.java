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
	public List<bookDTO> popularity_listAll( book_check check) {
		Map<String,Object> map=new HashMap<>();
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

	@Override
	//장르로 청구기호생성
	public String create_callName(String book_genre,String book_author) {
		String callName="";
		float random=(float) (Math.random()*99+1); //랜덤생성
		random = (float) (Math.round(random*100.0)/100.0);//소수점 둘째자리수까지
		
		switch(book_genre) {
			case "철학":
				callName="1"; break;
			case "종교":
				callName="2"; break;
			case "경제":
			case "경영":
			case "자기계발":
				callName="3"; break;
			case "자연과학":
				callName="4"; break;
			case "it":
				callName="5"; break;
			case "예술":
				callName="6"; break;
			case "인문":
			case "국어":
				callName="7"; break;
			case "만화/라이트노벨":
			case "에세이":
			case "판타지/무협":
			case "어린이":
			case "소설/시/희곡":
			case "청소년":
			case "유아":
				callName="8"; break;
			case "역사":
				callName="9"; break;
			default:
				callName="0"; break;	
		}
		String char_author=book_author.substring(0,1); //지은이 성만 가져오기
		
		callName=callName+random+char_author;
		
		System.out.println("청구번호:"+callName);
		
		//중복체크
		String check_callName=sqlSession.selectOne("book.check_callName",callName);
		System.out.println("중복체크:"+check_callName);
		
		if(check_callName!=null)
			create_callName(book_genre,book_author); //함수 다시실행
		
		return callName;
	}


	
	
}
