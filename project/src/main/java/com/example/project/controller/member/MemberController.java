package com.example.project.controller.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.project.model.member.DTO.MemberDTO;
import com.example.project.model.rent.DTO.RentDTO;
import com.example.project.service.member.MemberService;
import com.example.project.service.member.Pager;



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
        System.out.println("아이디뭐야"+dto.getUserid());
		
		  int adminCk = memberService.adminCheck(dto.getUserid());
			if(result) {//login성공시
			mav.setViewName("home");//뷰의 이름
			mav.addObject("adminCk", adminCk);

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
	
	
	
	
	
	//관리자가 회원 리스트 보기
	@RequestMapping("list.do")
	public ModelAndView list(			
			@RequestParam(defaultValue = "userid") String search_option,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "1") int curPage) throws Exception{
		
		//레코드 갯수 계산
		int count=memberService.countMember(search_option,keyword);
		//페이지 관련 설정
		Pager pager=new Pager(count, curPage);
		int start=pager.getPageBegin();
		int end=pager.getPageEnd();
		
		List<MemberDTO> list=memberService.listMember(search_option,keyword,start,end);
		logger.info(list.toString());
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map=new HashMap<>();
		map.put("list", list);
		map.put("count", count);//레코드 갯수 파악
		map.put("pager", pager);//페이지 네비게이션을 위한 변수
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		
		mav.setViewName("member/member_list");//포워딩
		mav.addObject("map", map); //ModelAndView에 map을 저장
		return mav; //board/list.jsp로 데이터와 함께 이동
	}
	
	
	//회원 리스트에서 이름 클릭시 회원 정보 보기
	@RequestMapping("admin_view.do")
	public ModelAndView view(String userid, HttpSession session) 
			throws Exception{
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("member/admin_view");//포워딩할 뷰의 이름
		mav.addObject("dto", memberService.readMember(userid));//자료저장
		return mav; //board/view.jsp로 포워딩
		
	}
	
	//회원정보 중 도서대출 목록 가져오기
	@RequestMapping("adminList.do")
	public ModelAndView adminList(String userid, ModelAndView mav)
			throws Exception {
		
		Map<String, Object> map = new HashMap<>();
		List<RentDTO> list = memberService.listRent(userid);
		
		map.put("list", list);
		map.put("count", list.size());
		mav.setViewName("member/admin_view");
		mav.addObject("map", map);
		return mav;

		
	}
		
	


}
