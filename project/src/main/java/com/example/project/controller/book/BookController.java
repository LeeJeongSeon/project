package com.example.project.controller.book;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("book/*")
public class BookController {

	@RequestMapping("list.do")
	public String list() {
		return "book_list/book_list";
	}
}
