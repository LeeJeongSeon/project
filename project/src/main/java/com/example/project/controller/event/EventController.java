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
}
