package com.example.project.controller.event;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.project.service.event.JoinService;

@Controller
@RequestMapping("event_join/*")
public class JoinController {
	
	@Inject
	JoinService joinService;
	
	@RequestMapping("list.do")
	public ModelAndView list(@RequestParam(defaultValue = "1") int curPage) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("joinListAdmin");
		return mav;
	}
	
	@RequestMapping("insert.do")
	public String insert(int ej_num, String ej_userid) throws Exception {
		joinService.insert(ej_num, ej_userid);
		return "event/joinList";
	}
}
