package com.example.project.model.review.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.project.model.review.dto.ReviewDTO;

@Repository
public class ReviewDAOImpl implements ReviewDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public void deleteFile(String review_fullName) {
		sqlSession.delete("review.deleteFile", review_fullName);

	}

	@Override
	public List<String> getAttach(int review_bno) {
		return sqlSession.selectList("review.getAttach", review_bno);
	}

	@Override
	public void addAttach(String fullName) {
		sqlSession.insert("review.addAttach", fullName);

	}

	@Override
	public void updateAttach(String review_fullName, int review_bno) {
		Map<String,Object> map=new HashMap<>();
		map.put("review_fullName", review_fullName);//첨부파일 이름
		map.put("review_bno", review_bno);//게시물 번호
		sqlSession.insert("review.updateAttach", map);
		//게시물 board는 update이지만 첨부파일attach는 기존 파일이 있다
		//하더라도 기존것은 그대로 두거나 또는 새파일을 올려 수정(insert)하는
		//것이기 때문에 insert()씀

	}

	
	@Override
	public void create(ReviewDTO dto) throws Exception {
		sqlSession.insert("review.insert", dto);

	}

	@Override
	public void update(ReviewDTO dto) throws Exception {
		sqlSession.update("review.update", dto);

	}

	@Override
	public void delete(int review_bno) throws Exception {
		sqlSession.delete("review.delete", review_bno);

	}

	@Override
	public List<ReviewDTO> listAll(String search_option, String keyword, int start, int end) throws Exception {
		Map<String,Object> map=new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", "%"+keyword+"%");
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("review.listAll", map);
	}

	@Override
	public void increaseViewcnt(int review_bno) throws Exception {
		sqlSession.update("review.increaseViewcnt", review_bno);

	}

	@Override
	public int countArticle(String search_option, String keyword) throws Exception {

		Map<String,String> map=new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", "%"+keyword+"%");
		return sqlSession.selectOne("review.countArticle",map);
	}

	@Override
	public ReviewDTO read(int review_bno) throws Exception {
		return sqlSession.selectOne("review.read", review_bno);
	}

}
