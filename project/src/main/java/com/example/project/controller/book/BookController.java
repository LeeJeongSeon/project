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

import com.example.project.model.book.VO.book_check;
import com.example.project.model.book.dto.bookDTO;
import com.example.project.service.BookService;
import com.example.project.service.Pager;


@Controller
@RequestMapping("book/*")
public class BookController {

	@Inject
	BookService bookService;
	
	//목록 조회
	@RequestMapping("list.do")
	public ModelAndView list(
			@RequestParam(defaultValue = "book_name") String search_option,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "1") int curPage) throws Exception{
		//레코드 갯수 계산
		int count=bookService.countArticle(search_option,keyword);
		//페이지 관련 설정
		Pager pager=new Pager(count, curPage);
		int start=pager.getPageBegin();
		int end=pager.getPageEnd();
		
		System.out.println("검색:"+start);
		System.out.println("검색:"+end); 
		List<bookDTO> list=bookService.listAll(search_option,keyword,start,end);
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map=new HashMap<>();
		map.put("list", list);
		map.put("count", count);
		map.put("pager", pager);
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		
		mav.setViewName("book_list/book_list");//포워딩
		mav.addObject("map", map); 
		return mav;
	}
	
	//상세보기
	@RequestMapping("view.do")
	public ModelAndView view(int book_id, HttpSession session) 
			throws Exception{
		ModelAndView mav=new ModelAndView();
		mav.setViewName("book_list/view");
		mav.addObject("dto", bookService.read(book_id));
		return mav;
		
	}
	
	//체크박스로 장르검색
	@RequestMapping("checkbox.do")
	public ModelAndView checkbox(@RequestParam String checklist[]) {
		book_check check=new book_check();
		check.setChecklist(checklist);
		System.out.println("체크박스 값:"+checklist);
		
		List<bookDTO> list=bookService.list_checkbox(check);
		System.out.println("리스트 값:"+list);
		//ModelAndView mav=new ModelAndView();
		//mav.setViewName("book_list/search");//포워딩
		//mav.addObject("list", list); 
		
		return null;
		
	}
}
