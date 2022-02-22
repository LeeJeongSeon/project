package com.example.project.controller.rent;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;


import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.project.model.rent.DTO.RentDTO;
import com.example.project.service.book.BookService;
import com.example.project.service.rent.RentService;

@Controller
@RequestMapping("/rent/*")
public class RentController {
	@Inject
	RentService rentService;
	
	@Inject
	BookService bookService;
	
	@RequestMapping("list.do")
	public ModelAndView list(HttpSession session, ModelAndView mav) {
		Map<String, Object> map = new HashMap<>();
		String userid=(String)session.getAttribute("userid");
		
		if(userid != null) {
			List<RentDTO> list = rentService.listRent(userid);
			
			map.put("list", list);
			map.put("count", list.size());
			mav.setViewName("rent/list");
			mav.addObject("map", map);
			return mav;
		}else {
			return new ModelAndView("member/login", "", null);
		}
		
	}
	
	@RequestMapping("nlist.do")
	   public ModelAndView listN(HttpSession session, ModelAndView mav) {
	      Map<String, Object> map = new HashMap<>();
	      String userid=(String)session.getAttribute("userid");
	      
	      if(userid != null) {
	         List<RentDTO> list = rentService.listRentN(userid);
	         
	         map.put("list", list);
	         map.put("count", list.size());
	         map.put("show", "n");
	         mav.setViewName("rent/list");
	         mav.addObject("map", map);
	         return mav;
	      }else {
	         return new ModelAndView("member/login", "", null);
	      }
	      
	   }
	
	@Transactional //트랜잭션 사용
	@RequestMapping("insert.do")
	public String insert(HttpSession session, 
			@ModelAttribute RentDTO dto) {
		String userid = (String)session.getAttribute("userid");
		
		  if(userid == null) { return "redirect:/member/login.do"; }
		
		dto.setUserid(userid);
		rentService.insert(dto);
		
		//대출횟수 증가와 대출중인지 체크
		
		  int book_id=dto.getBook_id();
		  System.out.println("북 아이디:"+book_id);
		  bookService.book_increase(book_id);
		 
		return "redirect:/rent/list.do";
	}
	
	@RequestMapping("update.do")
	public String update(@RequestParam int[] bnum, HttpSession session) {
		String userid=(String)session.getAttribute("userid");
		if(userid != null) {
			for(int i=0; i<bnum.length; i++) {
				RentDTO dto=new RentDTO();
				dto.setUserid(userid);
				dto.setBnum(bnum[i]);
				rentService.modifyRent(dto);
			/*}else {
				RentDTO dto=new RentDTO();
				dto.setUserid(userid);
				dto.setBnum(bnum[i]);
				rentService.modifyRent(dto);*/
			}
		}
		return "redirect:/rent/list.do";
	}
	
	@RequestMapping("extend.do")
	public String extend(@RequestParam int[] bnum,HttpSession session) {
	 String userid=(String)session.getAttribute("userid");
	  if(userid != null) {
	   for(int i=0; i<bnum.length; i++) {
	    rentService.extend(bnum[i]);
	}
	}
	return "redirect:/rent/list.do";
}
	
	@RequestMapping("delete.do")
	public String delete(@RequestParam int bnum, HttpSession session) {
		if(session.getAttribute("userid") != null) {
			rentService.delete(bnum);
		}
		return "redirect:/rent/nlist.do";
	}
	
	//대출
	@Transactional 
	@RequestMapping("re.do")
	public String re(@RequestParam int[] bnum,HttpSession session) {
		String userid=(String)session.getAttribute("userid");
		if(userid != null) {
			   for(int i=0; i<bnum.length; i++) {
			    rentService.re(bnum[i]);
			    bookService.update(bnum[i]);
			}
		/* rentService.delete(bnum); */
		//book테이블 도서대출가능으로 바꾸기
		/* bookService.update(bnum[i]); */
		}
		return "redirect:/rent/list.do";
	}
	
	@RequestMapping("show.do")
	public String hide(@RequestParam int bnum, HttpSession session) {
		if(session.getAttribute("userid") != null) {
			rentService.show(bnum);
		}
		return "redirect:/rent/list.do";
	}
}
