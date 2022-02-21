package com.example.project.controller.notice_qna;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.project.model.member.DTO.MemberDTO;
import com.example.project.model.notice_qna.dto.Notice_qnaDTO;
import com.example.project.service.member.MemberService;
import com.example.project.service.notice_qna.Notice_qnaService;
import com.example.project.service.notice_qna.Pager;


@Controller
@RequestMapping("notice_qna/*")
public class Notice_qnaController {
	
	@Inject
	Notice_qnaService notice_qnaService;
	@Inject
	MemberService memberService;
	
	@RequestMapping("list.do")
	public ModelAndView list(String category,HttpSession session,
			@RequestParam(defaultValue = "subject") String search_option,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "1")  int curPage) throws Exception{
		String cate="";
		int adminCk=0;
		String id=(String)session.getAttribute("userid");
		if(id != null) {
		 adminCk = memberService.adminCheck(id);
		}
		ModelAndView mav = new ModelAndView();
		if(category.equals("notice")) {
			 cate = "notice";
			mav.setViewName("notice_qna/notice");
		}else if(category.equals("qna")) {
			 cate = "qna";
			mav.setViewName("notice_qna/qna");
		}
		System.out.println("카테고리"+cate);
		int count=notice_qnaService.listCount(cate,search_option,keyword);
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		List<Notice_qnaDTO> noticeList=notice_qnaService.noticeList();
		List<Notice_qnaDTO> list =notice_qnaService.list(cate, start, end,search_option,keyword);
		Map<String,Object> map = new HashMap<>();
		map.put("list", list);
		map.put("pager", pager);
		map.put("count", count);
		map.put("noticeList", noticeList);
		map.put("keyword", keyword);
		map.put("search_option", search_option);
		mav.addObject("adminCk", adminCk);
		mav.addObject("map",map);
		return mav;
	}
	
	@RequestMapping("write.do")
	public ModelAndView write(String category) throws Exception{
		String cate="";
		String tab="";
		ModelAndView mav = new ModelAndView();
		if(category.equals("notice")) {
			cate="공지쓰기";
			tab="notice";
		}else {
			cate="질문하기";
			tab="qna";
		}
		Map<String,Object> map = new HashMap<>();
		map.put("tab", tab);
		map.put("cate", cate);
		mav.setViewName("notice_qna/write");
		mav.addObject("map", map);
		return mav;
	}
	@RequestMapping("insert.do")
	public String insert(@ModelAttribute Notice_qnaDTO dto, 
			HttpSession session) throws Exception {
		
		  String id=(String)session.getAttribute("userid");
		dto.setId(id);
		
		notice_qnaService.create(dto);
		return "redirect:/notice_qna/list.do?category="+dto.getCategory();
	}
	@RequestMapping("view.do")
	public ModelAndView view(int num, String category, 
			HttpSession session) throws Exception{
		int adminCk=0;
		String id=(String)session.getAttribute("userid");
		if(id != null) {
		 adminCk = memberService.adminCheck(id);
		}
		ModelAndView mav = new ModelAndView();
		if(category.equals("notice")) {
			mav.setViewName("notice_qna/notice_view");
		}else if(category.equals("qna")) {
			mav.setViewName("notice_qna/qna_view");
		}
		notice_qnaService.viewCount(num,session);
		mav.addObject("dto", notice_qnaService.view(num));
		mav.addObject("adminCk", adminCk);
		return mav;
	}
	@RequestMapping("noticeNY.do")
	public String noticeNY(int num, String notice)throws Exception {
		notice_qnaService.noticeNy(num,notice);
		
		return "redirect:/notice_qna/list.do?category=notice";
	}
	@RequestMapping("delete.do")
	public String delete(int num,String category) throws Exception{
		notice_qnaService.delete(num);
		return "redirect:/notice_qna/list.do?category="+category;
	}
	@RequestMapping("updateView.do")
	public ModelAndView updateView(int num) throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto",notice_qnaService.view(num));
		mav.setViewName("notice_qna/updateView");
		return mav;
	}
	@RequestMapping("update.do")
	public String update(@ModelAttribute Notice_qnaDTO dto) throws Exception{
		System.out.println("디티오뭐여ㅑ:"+dto);
		
			notice_qnaService.update(dto);
		
		return "redirect:/notice_qna/list.do?category="+dto.getCategory();
	}
	@RequestMapping("replyView.do")
	public ModelAndView replyView(int num) throws Exception{
		ModelAndView mav=new ModelAndView();
		mav.addObject("dto", notice_qnaService.view(num));
		mav.setViewName("notice_qna/replyView");
		return mav;
	}
	@RequestMapping("insertReply.do")
	public String insertReply(@ModelAttribute Notice_qnaDTO dto, HttpSession session) throws Exception{
		
		 String id=(String)session.getAttribute("userid");
			/* String id2="hong"; */
		dto.setId(id);
		dto.setRef(dto.getNum());
		int ref=dto.getRef();		
		int ref_step=dto.getRef_step()+1;
		int re_level=dto.getRe_level()+1;
		dto.setRef_step(ref_step);
		dto.setRe_level(re_level);
		System.out.println("스텝"+ref_step);
		System.out.println("ref"+ref);
		
		notice_qnaService.updateStep(ref,ref_step);
		notice_qnaService.reply(dto);
		return "redirect:/notice_qna/list.do?category=qna";
	}
	@RequestMapping("index.do")
	public ModelAndView notice_index() throws Exception {
		List<Notice_qnaDTO> noticeList=notice_qnaService.noticeList();
		System.out.println("리스트뭐여"+noticeList);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("notice_qna/notice_index");
		mav.addObject("noticeList", noticeList);
		return mav ;
	}

}
