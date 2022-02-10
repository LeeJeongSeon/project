package com.example.project.model.reply.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.project.model.reply.dto.ReviewReplyDTO;

@Repository
public class ReviewReplyDAOImpl implements ReviewReplyDAO {
	
	@Inject
	SqlSession sqlSession;

	@Override
	public List<ReviewReplyDTO> list(int review_bno) {
		return sqlSession.selectList("review_reply.listReply", review_bno);
	}

	@Override
	public int count(int review_bno) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void create(ReviewReplyDTO dto) {
		sqlSession.insert("review_reply.insertReply", dto);

	}

}
