package com.example.project.controller.event;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.project.service.event.JoinService;

@Controller
@RequestMapping("event_join/*")
public class JoinController {
	
	@Inject
	JoinService joinService;
	
	
}
