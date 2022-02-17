package com.example.project.controller.reply;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.project.model.reply.dto.ReviewReplyDTO;
import com.example.project.service.reply.ReviewReplyService;

@RestController
@RequestMapping("review_reply/*")
public class ReviewReplyController {
	
	@Inject
	ReviewReplyService reviewReplyService;
	
	//댓글 쓰기
	@RequestMapping("insert.do")
	public void insert(ReviewReplyDTO dto, HttpSession session) {
		String userid=(String)session.getAttribute("userid");
		dto.setReview_replyer(userid);
		reviewReplyService.create(dto);
	}
	
	
	//댓글 
	@RequestMapping("list.do")
	public ModelAndView list(int review_bno, ModelAndView mav) {
		List<ReviewReplyDTO> list=reviewReplyService.list(review_bno);
		mav.setViewName("review/reply_list");
		mav.addObject("list", list);
		return mav;//뷰로 이동
	}
	
	
	//댓글 쓰는 법 : json방식
	@RequestMapping("list_json.do")
	public List<ReviewReplyDTO> list_json(int review_bno){
		return reviewReplyService.list(review_bno);
	}
	
	

}
