package com.example.project.controller.event;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("event_reply/*")
public class ReplyController {

	
	/* 행사페이지로 이동 & 행사리스트 출력 */
	@RequestMapping("list.do")
	public ModelAndView list(int er_e_num) throws Exception {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("event/replyList");
		return mav;
	}
} 
