package com.example.project.service.reply;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.project.model.reply.dao.ReviewReplyDAO;
import com.example.project.model.reply.dto.ReviewReplyDTO;

@Service
public class ReviewReplyServiceImpl implements ReviewReplyService {
	
	@Inject
	ReviewReplyDAO reviewReplyDao;

	@Override
	public List<ReviewReplyDTO> list(int review_bno) {
		return reviewReplyDao.list(review_bno);
	}

	@Override
	public int count(int review_bno) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void create(ReviewReplyDTO dto) {
		reviewReplyDao.create(dto);

	}

}
