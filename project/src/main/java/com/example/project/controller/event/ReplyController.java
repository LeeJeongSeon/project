package com.example.project.controller.event;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.project.service.event.EventService;
import com.example.project.service.event.ReplyService;

@Controller
@RequestMapping("event_reply/*")
public class ReplyController {
	
	@Inject
	ReplyService replyService;
	@Inject
	EventService eventService;
	
	/* 댓글 목록 출력 */
	@RequestMapping("list.do")
	public ModelAndView list(int er_e_num) throws Exception {
		ModelAndView mav=new ModelAndView();
		mav.addObject("list2", replyService.list(er_e_num));
		mav.setViewName("event/replyList");
		return mav;
	}
	
	/* 관리자용 댓글 목록 출력 */
	@RequestMapping("listAdmin.do")
	public ModelAndView listAdmin() throws Exception {
		ModelAndView mav=new ModelAndView();
		mav.addObject("list2", replyService.listAdmin());
		mav.setViewName("event/replyListAdmin");
		return mav;
	}
	
	/* 댓글 수정 페이지로 이동 */
	@RequestMapping("change.do")
	public ModelAndView change(int target, int er_e_num) throws Exception {
		ModelAndView mav=new ModelAndView();
		Map<String, Object> map=new HashMap<>();
		map.put("dto", eventService.eventViewDetail(er_e_num));
		map.put("dto2", replyService.viewDetail(target));
		map.put("target", target);
		mav.addObject("map", map);
		mav.setViewName("event/replyChange");
		return mav;
	}
	
	/* 댓글 수정 & 댓글 달린 문화행사의 세부사항 페이지로 이동 */
	@RequestMapping("update.do")
	public String update(int er_num, String er_content, int er_e_num) throws Exception {
		replyService.update(er_num, er_content);
		return "redirect:/event/view.do?e_num="+er_e_num;
	}
	
	/* 댓글 삭제 & 댓글 달린 문화행사의 세부사항 페이지로 이동 */
	@RequestMapping("delete.do")
	public String delete(int er_num, @RequestParam(defaultValue = "0") int er_e_num) throws Exception {
		replyService.delete(er_num);
		if(er_e_num==0) {
			return "redirect:/event_reply/listAdmin.do";
		} else {
			return "redirect:/event/view.do?e_num="+er_e_num;			
		}
	}
	
} 
