package com.example.project.controller.email;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.project.model.email.EmailDTO;
import com.example.project.service.email.EmailService;

@Controller
@RequestMapping("email/*")
public class EmailController {
	
	@Inject
	EmailService emailService;
	
	@RequestMapping("sendEventResult.do")
	public String send(@ModelAttribute EmailDTO dto, Model model) throws Exception {
		String message=emailService.sendMail(dto);
		model.addAttribute("message", message);
		return "redirect:/event/listAdmin.do";
	}
}
