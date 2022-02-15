package com.example.project.controller.member;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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


	//로그인 체크
	@RequestMapping("login_check.do")
	public ModelAndView login_check(MemberDTO dto,HttpSession session) {
		boolean result = memberService.loginCheck(dto, session);
		ModelAndView mav = new ModelAndView();

		if(result) {//login성공시
			mav.setViewName("home");//뷰의 이름

		}else {//실패시
			mav.setViewName("member/login");
			mav.addObject("message","error");
		}
		return mav;

	}

	//로그아웃
	@RequestMapping("logout.do")
	public ModelAndView logout(HttpSession session, ModelAndView mav) {
		memberService.logout(session);

		mav.setViewName("member/login");
		mav.addObject("message","logout");

		return mav;

	}

	//회원등록
	@RequestMapping("write.do")
	public String write() {
		return "member/write";
	}

	//회원insert
	@RequestMapping("insert.do")
	public String insert(@ModelAttribute MemberDTO dto) {
		memberService.insertMember(dto);
		return "home";
	}

	//회원수정관련
	@RequestMapping("view.do")
	public String view(@RequestParam String userid, Model model) {
		model.addAttribute("dto", memberService.viewMember(userid));
		return "member/view";
	}

	//회원수정 업데이트
	@RequestMapping("update.do")
	public String update(MemberDTO dto, Model model) {
		//비밀번호 체크
		boolean result=memberService.checkPw(dto.getUserid(), 
				dto.getPasswd());
		if(result) {//비밀번호가 맞으면
			//회원정보 수정
			memberService.updateMember(dto);
			//수정 후 홈 이동
			return "home";
		}else {//비밀번호가 틀리면
			model.addAttribute("dto", dto);
			model.addAttribute("join_date", memberService.viewMember(
					dto.getUserid()).getJoin_date());
			model.addAttribute("message", "비밀번호를 확인하세요.");
			return "member/view";
		}
	}

	//회원삭제
	@RequestMapping("delete.do")
	public String delete(String userid, String passwd, Model model) {
		boolean result=memberService.checkPw(userid, passwd);
		if(result) {//비번이 맞으면 삭제
			memberService.deleteMember(userid);
			return "home";
		}else {
			model.addAttribute("message", "비밀번호를 확인하세요");
			model.addAttribute("dto", memberService.viewMember(userid));
			return "member/view";
		}
	}
	
	
	
	






}
