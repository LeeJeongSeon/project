package com.example.project.controller.book;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.project.model.book.dto.hopeBookDTO;
import com.example.project.service.book.HopeBookService;
import com.example.project.service.book.Pager;

@Controller
@RequestMapping("HopeBook/*")
public class HopeBookController {

	@Inject
	HopeBookService hopeBookSercvie;
	
	//게시판 목록
	@RequestMapping("list.do")
	public ModelAndView list(
			@RequestParam(defaultValue = "hopeBook_bookname") String search_option,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "1") int curPage
			)throws Exception{
		
		System.out.println("임시:"+search_option);
		
		//레코드 갯수 계산
		int count=hopeBookSercvie.countArticle(search_option,keyword);
		
		//페이지 관련 설정
		Pager pager=new Pager(count, curPage);
		int start=pager.getPageBegin();
		int end=pager.getPageEnd();	
		
		List<hopeBookDTO> list=hopeBookSercvie.listAll(search_option,keyword,start,end);
		Map<String, Object> map=new HashMap<>();
		map.put("list", list);
		map.put("count", count);
		map.put("pager", pager);
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("book_list/HopeBook_list");
		mav.addObject("map", map); 
		return mav;
	}
	
	//상세보기
	@RequestMapping("view.do")
	public ModelAndView view(int hopeBook_id, HttpSession session) 
			throws Exception{
		List<hopeBookDTO> list=hopeBookSercvie.view(hopeBook_id);
		ModelAndView mav=new ModelAndView();
		mav.setViewName("book_list/HopeBook_view");
		mav.addObject("list", list);
		return mav;
	}
	
	//게시물 작성 페이지 이동
	@RequestMapping("write.do")
	public ModelAndView write() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("book_list/HopeBook_write");
		return mav;
	}
	
	//게시물 작성
	@RequestMapping("insert.do")
	public String insert(@ModelAttribute hopeBookDTO dto) {
		hopeBookSercvie.insertBook(dto);
		return "redirect:/HopeBook/list.do";
	}
	
	//답변 페이지로 이동
		@RequestMapping("reply.do")
		public ModelAndView reply(@ModelAttribute hopeBookDTO dto) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("book_list/HopeBook_reply");
			mav.addObject("dto", dto); 
			return mav;
		}
	
	//답변달기
	@RequestMapping("insertReply.do")
	public String insertReply(@ModelAttribute hopeBookDTO dto) {
		hopeBookDTO dto2=hopeBookSercvie.read(dto.getHopeBook_id());
		dto2.setHopeBook_content(dto.getHopeBook_content());
		dto2.setHopeBook_title(dto.getHopeBook_title());
		dto2.setHopeBook_userid(dto.getHopeBook_userid());
		dto2.setName("관리자");
			
		int ref=hopeBookSercvie.ref(dto.getRef());//답변그룹번호
		int re_step=dto.getRe_step()+1;//출력순번
		int re_level=dto.getRe_level()+1;//답변단계
			
		dto2.setRef(ref);
		dto2.setRe_step(re_step);
		dto2.setRe_level(re_level);
			
			
		hopeBookSercvie.reply(dto2);
		System.out.println("답변:"+dto2);
			
		return "redirect:/HopeBook/list.do";
		}
		
		//도서중복체크
		@RequestMapping("hopeBook_check.do")
		@ResponseBody
		public int hopeBook_check(
				@RequestParam String hopeBook_author,
				@RequestParam String hopeBook_bookname
				) {
			System.out.println(hopeBook_author+","+hopeBook_bookname);
			int check=0;
			
			String check_val=hopeBookSercvie.check(hopeBook_author,hopeBook_bookname);
			if(check_val==null) { //중복 존재하지 않음
				check=0;
			}else {	//중복 존재 
				check=1;
			}
			return check;
		}
		
}
