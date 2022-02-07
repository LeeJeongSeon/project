package com.example.project.controller.book;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.project.model.book.VO.book_check;
import com.example.project.model.book.dto.bookDTO;
import com.example.project.service.book.BookService;
import com.example.project.service.book.Pager;


@Controller
@RequestMapping("book/*")
public class BookController {

	@Inject
	BookService bookService;
	
	//목록 조회
	@RequestMapping("list.do")
	@ResponseBody
	public ModelAndView list(
			@RequestParam(defaultValue = "book_name") String search_option,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "1") int curPage,
			@RequestParam(defaultValue="",value="check",required=true) List<String> checkbox
			) throws Exception{
		String checklist[]=checkbox.toArray(new String[checkbox.size()]);
		book_check check=new book_check();
		check.setChecklist(checklist);
			
		//레코드 갯수 계산
		int count=bookService.countArticle(search_option,keyword,check);
		System.out.println("레코드 갯수:"+count);
		
		//페이지 관련 설정
		Pager pager=new Pager(count, curPage);
		int start=pager.getPageBegin();
		int end=pager.getPageEnd();
		System.out.print("게시물결과:"+start+","+end+"\n");
		
		List<bookDTO> list=bookService.listAll(search_option,keyword,start,end,check);
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map=new HashMap<>();
		map.put("list", list);
		map.put("count", count);
		map.put("pager", pager);
		map.put("search_option", search_option);
		map.put("keyword", keyword);
			
		mav.setViewName("book_list/book_list");
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
	@ResponseBody
	public void checkbox(@RequestParam(value="check",required=true) List<String> checkbox) {
		String checklist[]=checkbox.toArray(new String[checkbox.size()]);
		book_check check=new book_check();
		check.setChecklist(checklist);
		
		List<bookDTO> list=bookService.list_checkbox(check);
		//ModelAndView mav=new ModelAndView();
		//mav.setViewName("book_list/search");//포워딩
		//mav.addObject("list", list); 
		
		//ModelAndView
		//return mav;
		
	}
	
	//인기순 정렬보기
	@RequestMapping("popularity_list.do")
	public ModelAndView popularity_list(
			@RequestParam(defaultValue = "1") int curPage,
			@RequestParam(defaultValue="",value="check",required=true) List<String> checkbox
			) throws Exception{
		String checklist[]=checkbox.toArray(new String[checkbox.size()]);
		book_check check=new book_check();
		check.setChecklist(checklist);
			
		//레코드 갯수 10개로 설정 계산
		int count=10;
		//페이지 관련 설정
		Pager pager=new Pager(count, curPage);
		int start=pager.getPageBegin();
		int end=pager.getPageEnd();
		
		List<bookDTO> list=bookService.popularity_listAll(start,end,check);
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map=new HashMap<>();
		map.put("list", list);
		map.put("count", count);
		map.put("pager", pager);
		
		mav.setViewName("book_list/popularity_list");
		mav.addObject("map", map); 
		return mav;
	}
}
