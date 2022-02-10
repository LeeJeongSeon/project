package com.example.project.controller.member;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.project.model.member.DTO.MemberDTO;
import com.example.project.service.member.MemberService;



@Controller
@RequestMapping("member/*")
public class MemberController {

	//로깅
	private static final Logger logger
	=LoggerFactory.getLogger(MemberController.class);


	@Inject
	MemberService memberService;
	
	
	@RequestMapping("login.do")
	public String login() {
		return "member/login";

	}

	@RequestMapping("login_check.do") //로그인 체크
	public ModelAndView login_check(MemberDTO dto,HttpSession session) {
		boolean name = memberService.loginCheck(dto, session);
		ModelAndView mav = new ModelAndView();

		if(name) {//login성공시
			mav.setViewName("home");//뷰의 이름
		}else {//실패시
			mav.setViewName("member/login");
			mav.addObject("message","error");
		}
		return mav;

	}

	@RequestMapping("logout.do")// 로그아웃
	public ModelAndView logout(HttpSession session, ModelAndView mav) {
		memberService.logout(session);
		
		mav.setViewName("member/login");
		mav.addObject("message","logout");

		return mav;

	}




}
