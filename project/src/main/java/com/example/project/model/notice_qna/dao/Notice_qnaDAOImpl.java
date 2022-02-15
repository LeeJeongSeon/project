package com.example.project.model.notice_qna.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.project.model.notice_qna.dto.Notice_qnaDTO;

@Repository
public class Notice_qnaDAOImpl implements Notice_qnaDAO {
	
	@Inject
	SqlSession sqlSession;

	@Override
	public List<Notice_qnaDTO> list(String cate, int start, int end,String search_option, String keyword )throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("cate", cate);
		map.put("start", start);
		map.put("end", end);
		map.put("keyword", "%"+keyword+"%");
		map.put("search_option", search_option);
		return sqlSession.selectList("notice_qna.list",map);
	}

	@Override
	public int listCount(String cate,String search_option, String keyword) throws Exception {
		Map<String,Object> map =new HashMap<>();
		map.put("cate", cate);
		map.put("search_option", search_option);
		map.put("keyword", "%"+keyword+"%");
		return sqlSession.selectOne("notice_qna.listCount",map);
	}

	@Override
	public List<Notice_qnaDTO> noticeList() throws Exception{
		return sqlSession.selectList("notice_qna.noticeList");
	}

	@Override
	public void create(Notice_qnaDTO dto)throws Exception {
		sqlSession.insert("notice_qna.insert",dto);
		
	}

	@Override
	public void viewCount(int num) throws Exception{
		sqlSession.update("notice_qna.viewCount",num);
	}

	@Override
	public Notice_qnaDTO view(int num) throws Exception {
		return sqlSession.selectOne("notice_qna.view",num);
	}

	@Override
	public void noticeNy(int num, String notice) throws Exception {
		Map<String,Object> map = new HashMap<>();
		map.put("num", num);
		map.put("notice", notice);
		sqlSession.update("notice_qna.noticeNy",map);
	}

	@Override
	public void delete(int num) throws Exception {
		sqlSession.delete("notice_qna.delete",num);
	}

	@Override
	public void update(Notice_qnaDTO dto) throws Exception {
		sqlSession.update("notice_qna.update",dto);
	}

	@Override
	public void updateStep(int ref, int ref_step) throws Exception {
		Notice_qnaDTO dto =new Notice_qnaDTO();
		dto.setRef(ref);
		dto.setRef_step(ref_step);
		sqlSession.update("notice_qna.updateStep",dto);
	}

	@Override
	public void reply(Notice_qnaDTO dto) throws Exception {
		sqlSession.insert("notice_qna.reply",dto);
	}



}
