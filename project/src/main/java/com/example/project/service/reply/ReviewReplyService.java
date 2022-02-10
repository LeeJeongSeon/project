package com.example.project.service.reply;

import java.util.List;

import com.example.project.model.reply.dto.ReviewReplyDTO;

public interface ReviewReplyService {
	public List<ReviewReplyDTO> list(int review_bno);
	public int count(int review_bno);
	public void create(ReviewReplyDTO dto);

}
