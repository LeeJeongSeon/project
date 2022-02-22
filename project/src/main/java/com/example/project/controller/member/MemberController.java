package com.example.project.controller.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.project.model.member.DTO.MemberDTO;
import com.example.project.service.book.Pager;
import com.example.project.service.member.MemberService;

@Controller
@RequestMapping("member/*")
public class MemberController {

	// 로깅
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Inject
	MemberService memberService;

	@RequestMapping("login.do")
	public String login() {
		return "member/login";

	}

	// 로그인 체크
	@RequestMapping("login_check.do")
	public ModelAndView login_check(MemberDTO dto, HttpSession session) {
		boolean result = memberService.loginCheck(dto, session);
		ModelAndView mav = new ModelAndView();

		if (result) {// login성공시
			mav.setViewName("home");// 뷰의 이름

		} else {// 실패시
			mav.setViewName("member/login");
			mav.addObject("message", "error");
		}
		return mav;

	}

	// 로그아웃
	@RequestMapping("logout.do")
	public ModelAndView logout(HttpSession session, ModelAndView mav) {
		memberService.logout(session);

		mav.setViewName("member/login");
		mav.addObject("message", "logout");

		return mav;

	}

	// 회원등록
	@RequestMapping("write.do")
	public String write() {
		return "member/write";
	}

	// 회원가입
	@RequestMapping("insert.do")
	public String insert(@ModelAttribute MemberDTO dto,@RequestParam("userid") String userid, Model md) {
		int cnt = memberService.idCheck(userid);
		if(cnt == 0) {
			memberService.insertMember(dto);
			return "member/login";

		}else {
			md.addAttribute("dto", dto);
			md.addAttribute("message", "아이디를 확인하세요.");
			return "member/write";

		}

	}

	// 회원수정관련
	@RequestMapping("view.do")
	public String view(@RequestParam String userid, Model model, MemberDTO dto) {
		model.addAttribute("dto", memberService.viewMember(userid));
		model.addAttribute("join_date", memberService.viewMember(dto.getUserid()).getJoin_date());
		return "member/view";
	}

	// 회원수정 업데이트
	@RequestMapping("update.do")
	public String update(MemberDTO dto, Model model) throws Exception {
		// 비밀번호 체크

		boolean result = memberService.checkPw(dto.getUserid(), dto.getPasswd());

		if (result) {// 비밀번호가 맞으면
			// 회원정보 수정
			memberService.updateMember(dto);
			// 수정 후 홈 이동
			return "home";
		} else {// 비밀번호가 틀리면
			model.addAttribute("join_date", memberService.viewMember(dto.getUserid()).getJoin_date());
			model.addAttribute("dto", dto);
			model.addAttribute("message", "비밀번호를 확인하세요.");
			return "member/view";
		}
	}

	// 회원삭제
	@RequestMapping("delete.do")
	public String delete(String userid, String passwd, Model model) {
		boolean result = memberService.checkPw(userid, passwd);
		if (result) {// 비번이 맞으면 삭제
			memberService.deleteMember(userid);
			return "home";
		} else {
			model.addAttribute("message", "비밀번호를 확인하세요");
			model.addAttribute("dto", memberService.viewMember(userid));
			return "member/view";
		}
	}

	// 아이디 찾기페이지로 이동
	@RequestMapping("find_id_form.do")
	public String find_id_form() throws Exception {
		return "member/find_id_form";
	}

	// 아이디 찾기
	@RequestMapping("find_id.do")
	public String find_id(HttpServletResponse response, @RequestParam("email") String email, String name, Model md)
			throws Exception {

		md.addAttribute("dto", memberService.find_id(response, email, name));
		return "member/find_id";
	}

	@RequestMapping("findpw.do") // 비밀번호 찾기페이지로 이동
	public String findpw() throws Exception {
		return "member/findpw";
	}

	// 비밀번호 찾기
	@Autowired
	private JavaMailSender mailSender;
	@RequestMapping("passwd.do")
	public ModelAndView passwd(String userid, String email) {

		ModelAndView mav = new ModelAndView();

		String pw = memberService.pwChange(userid, email);

		if (pw != null) {
			mav.addObject("dto", memberService.viewMember(userid));
			mav.setViewName("member/findpw");

			String setfrom = "librarynum5@gmail.com";
			String tomail = email;// 받는 사람 이메일
			String title = "쿠우쿠우 비밀번호 입니다.";// 제목
			String content = userid + "님의 비밀번호는 " + pw + "입니다."; // 내용
			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

				messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
				messageHelper.setTo(tomail); // 받는사람 이메일
				messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
				messageHelper.setText(content); // 메일 내용

				mailSender.send(message);
			} catch (Exception e) {
				e.printStackTrace();
			}
			mav.setViewName("member/findpw");
			mav.addObject("message", "ok");
			return mav;
		} else {
			mav.setViewName("member/findpw");
			mav.addObject("message", "error");
			return mav;
		}
	}

	// 아이디 중복검사
	@ResponseBody
	@RequestMapping("idCheck.do")
	public int idCheck(@RequestParam("userid") String userid){
		logger.info("userIdCheck 진입");
		logger.info("전달받은 id:"+userid);
		int cnt = memberService.idCheck(userid);
		logger.info("확인 결과:"+cnt);
		return cnt;
	}
	
    //비밀번호 변경페이지로 이동
	@RequestMapping("pwUpdateView.do")
	public String pwUpdateView(){

		return "member/pwUpdateView";
	}

    //비밀번호 변경
	@RequestMapping("pwUpdate.do")
	public ModelAndView pwUpdate(MemberDTO dto,String userid,String passwd,String passwd1,RedirectAttributes rttr,HttpSession session)throws Exception{
		ModelAndView mav= new ModelAndView();
		boolean result = memberService.checkPw(dto.getUserid(), dto.getPasswd());

		if(result) {
			memberService.pwUpdate(userid, passwd1);
			session.invalidate();
			mav.setViewName("member/login");
			mav.addObject("message", "pwUpdate");
			return mav;

		}else {
			mav.setViewName("member/pwUpdateView");
			mav.addObject("message", "error");
			return mav;
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
		


}
