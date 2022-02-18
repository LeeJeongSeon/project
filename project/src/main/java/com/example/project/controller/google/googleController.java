package com.example.project.controller.google;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("google/*")
public class googleController {
	
	@RequestMapping("google_login.do")
	public String google_login() {
		return "google/google_login";
	}
}
