package com.example.project.controller.event;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.project.service.event.EventService;
import com.example.project.service.event.JoinService;

@Controller
@RequestMapping("event_join/*")
public class JoinController {
	
	@Inject
	JoinService joinService;
	@Inject
	EventService eventService;
	
	@RequestMapping("list.do")
	public ModelAndView list() throws Exception {
		ModelAndView mav=new ModelAndView();
		Map<String, Object> map = new HashMap<>();
		map.put("list", eventService.eventList());
		map.put("list2", joinService.joinList());
		mav.addObject("map", map);
		mav.setViewName("event/joinListAdmin");
		return mav;
	}
	
	@RequestMapping("insert.do")
	public String insert(int ej_num, String ej_userid) throws Exception {
		joinService.insert(ej_num, ej_userid);
		return "event/joinList";
	}
	
	@RequestMapping("joinMember.do")
	public ModelAndView joinMember(int ej_num) throws Exception {
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", joinService.joinMember(ej_num));
		mav.setViewName("event/joinMember");
		return mav;
	}
}
