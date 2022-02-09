package com.example.project.controller.event;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.project.model.event.dto.EventDTO;
import com.example.project.service.event.EventService;

@Controller
@RequestMapping("event/*")
public class EventController {
	
	@Inject
	EventService eventService;
	
	/* 행사페이지로 이동 & 행사리스트 출력 */
	@RequestMapping("list.do")
	public String list(Model model) throws Exception {
		List<EventDTO> list=eventService.eventList();
		model.addAttribute("list", list);
		return "event/list";
	}
	
	/* 행사 상세보기 페이지로 이동 */
	@RequestMapping("view.do")
	public ModelAndView view(int e_num, HttpSession session) throws Exception {
		eventService.updateEReadCount(e_num, session);
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", eventService.eventViewDetail(e_num));
		mav.setViewName("event/view");
		return mav;
	}
	
	/* 행사신청 페이지로 이동 */
	@RequestMapping("write.do")
	public String write() throws Exception {
		return "event/write";
	}
	
	/* 행사신청 후 행사페이지로 이동 */
	@RequestMapping("insert.do")
	public String insert(@ModelAttribute EventDTO dto) throws Exception {
		eventService.insert(dto);
		return "redirect:/event/list.do";
	}
	
	/* 행사관리 페이지로 이동 & 행사리스트 출력 */
	@RequestMapping("listAdmin.do")
	public String listAdmin(Model model) throws Exception {
		List<EventDTO> list=eventService.eventListForAdmin();
		model.addAttribute("list", list);
		return "event/listAdmin";
	}
	
	/* 행사관리 상세보기 페이지로 이동 */
	@RequestMapping("viewAdmin.do")
	public ModelAndView viewAdmin(int e_num) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", eventService.eventViewDetail(e_num));
		mav.setViewName("event/viewAdmin");
		return mav;
	}
	
	/* 행사신청 승인처리 후 행사관리 페이지로 이동*/
	@RequestMapping("approve.do")
	public String approve(int e_num) throws Exception {
		eventService.approve(e_num);
		return "redirect:/event/listAdmin.do";
	}
	
} 
