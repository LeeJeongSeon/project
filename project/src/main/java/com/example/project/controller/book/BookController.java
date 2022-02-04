package com.example.project.controller.book;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.project.model.book.dto.bookDTO;
import com.example.project.service.BookService;
import com.example.project.service.Pager;


@Controller
@RequestMapping("book/*")
public class BookController {

	@Inject
	BookService bookService;
	
	@RequestMapping("list.do")
	public ModelAndView list(
			@RequestParam(defaultValue = "name") String search_option,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "1") 
	int curPage) throws Exception{
		//레코드 갯수 계산
		int count=bookService.countArticle(search_option,keyword);
		System.out.println("임시:"+count);
		//페이지 관련 설정
		Pager pager=new Pager(count, curPage);
		int start=pager.getPageBegin();
		int end=pager.getPageEnd();
		
		List<bookDTO> list=bookService.listAll(search_option,keyword,start,end);
		System.out.println("임시2:"+list);
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map=new HashMap<>();
		map.put("list", list);
		map.put("count", count);//레코드 갯수 파악
		map.put("pager", pager);//페이지 네비게이션을 위한 변수
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		
		mav.setViewName("book_list/book_list");//포워딩
		mav.addObject("map", map); 
		return mav;
	}
	
	@RequestMapping("view.do")
	public ModelAndView view(int book_id, HttpSession session) 
			throws Exception{
		ModelAndView mav=new ModelAndView();
		mav.setViewName("book_list/view");
		mav.addObject("dto", bookService.read(book_id));
		return mav;
		
	}
}
