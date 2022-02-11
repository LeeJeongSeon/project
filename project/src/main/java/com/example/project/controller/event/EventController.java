package com.example.project.controller.event;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.project.model.event.dto.EventDTO;
import com.example.project.service.event.EventPager;
import com.example.project.service.event.EventService;

@Controller
@RequestMapping("event/*")
public class EventController {
	
	@Inject
	EventService eventService;
	
	/* 행사페이지로 이동 & 행사리스트 출력 */
	@RequestMapping("list.do")
	public ModelAndView list(
				@RequestParam(defaultValue = "all") String search_option,
				@RequestParam(defaultValue = "") String keyword,
				@RequestParam(defaultValue = "1") int curPage) throws Exception {
		int count=eventService.countEvent(search_option, keyword);
		EventPager pager=new EventPager(count, curPage);
		int start=pager.getPageBegin();
		int end=pager.getPageEnd();
		List<EventDTO> list=eventService.eventList(search_option, keyword, start, end);
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("count", count);
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		map.put("pager", pager);
		mav.setViewName("event/list");
		mav.addObject("map", map);
		return mav;
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
	public ModelAndView listAdmin(
			@RequestParam(defaultValue = "all") String list_option,
			@RequestParam(defaultValue = "") String past,
			@RequestParam(defaultValue = "1") int curPage) throws Exception {
		int count=eventService.countEventForAdmin(list_option, past);
		EventPager pager=new EventPager(count, curPage);
		int start=pager.getPageBegin();
		int end=pager.getPageEnd();
		List<EventDTO> list=eventService.eventListForAdmin(list_option, past, start, end);
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("count", count);
		map.put("list_option", list_option);
		map.put("past", past);
		map.put("pager", pager);
		mav.addObject("map", map);
		mav.setViewName("event/listAdmin");
		return mav;
	}
	
	/* 행사관리 상세보기 페이지로 이동 */
	@RequestMapping("viewAdmin.do")
	public ModelAndView viewAdmin(int e_num) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", eventService.eventViewDetail(e_num));
		mav.setViewName("event/viewAdmin");
		return mav;
	}
	
	/* 행사신청 승인/반려 처리 후 행사관리 페이지로 이동*/
	@RequestMapping("result.do")
	public String result(int e_num, int e_result) throws Exception {
		eventService.result(e_num, e_result);
		return "redirect:/event/listAdmin.do";
	}
	
	/* 이메일로 신청한 행사 조회 */
	@RequestMapping("checkEmail.do")
	public String checkEmail(String e_email) throws Exception {
		System.out.println(e_email);
		int eventCount = eventService.checkEmail(e_email);
		String result="";
		if(eventCount==0) {
			result="redirect:/event/list.do?message=no";			
		}else {
			result="redirect:/event/info.do?eventCount="+eventCount+"&e_email="+e_email;
		}
		return result;
	}
	
	/* 행사 수정/삭제 페이지로 이동 */
	@RequestMapping("info.do")
	public ModelAndView info(int eventCount, String e_email) throws Exception {
		ModelAndView mav = new ModelAndView();
		if(eventCount==1) {
			mav.addObject("dto", eventService.eventViewDetail(eventService.checkENum(e_email)));
		}
		mav.setViewName("event/info");
		return mav;
	}	
	
} 
