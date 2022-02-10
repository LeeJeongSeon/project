package com.example.project.controller.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.project.model.review.dto.ReviewDTO;
import com.example.project.service.review.Pager;
import com.example.project.service.review.ReviewService;

@Controller
@RequestMapping("review/*")
public class ReviewController {
	//로깅
	private static final Logger logger
	=LoggerFactory.getLogger(ReviewController.class);
	
	@Inject
	ReviewService reviewService;
	
	
	//메뉴바에서 게시판을 클릭하면 발동됨
	//게시판 페이지에서 조회 누르면 발동됨
	@RequestMapping("list.do")
	public ModelAndView list(			
			@RequestParam(defaultValue = "review_writer") String search_option,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "1") int curPage) throws Exception{
		
		//레코드 갯수 계산
		int count=reviewService.countArticle(search_option,keyword);
		//페이지 관련 설정
		Pager pager=new Pager(count, curPage);
		int start=pager.getPageBegin();
		int end=pager.getPageEnd();
		
		List<ReviewDTO> list=reviewService.listAll(search_option,keyword,start,end);
		logger.info(list.toString());
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map=new HashMap<>();
		map.put("list", list);
		map.put("count", count);//레코드 갯수 파악
		map.put("pager", pager);//페이지 네비게이션을 위한 변수
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		
		mav.setViewName("review/list");//포워딩
		mav.addObject("map", map); //ModelAndView에 map을 저장
		return mav; //board/list.jsp로 데이터와 함께 이동
	}
	
	
	
	
	
	@RequestMapping("write.do")
	public String write() {
		//글쓰기 페이지로 이동
		return "review/write";
	}
	
	

	
	
	//write.jsp에서 확인버튼을 누르면 발동
	@RequestMapping("insert.do")
	public String insert(@ModelAttribute ReviewDTO dto, 
			HttpSession session) throws Exception{
		
		//여기 userid 맞음? 세션값으로 userid가 들어올것 같은데
		String review_writer=(String)session.getAttribute("userid");
		
		dto.setReview_writer(review_writer);
		//레코드 저장
		reviewService.create(dto);
		//게시물 목록으로 이동
		return "redirect:/review/list.do";
	}
	
	
	
	
	
	//게시판에서 사용자 아이디를 누르면 발동 : 쓴 글을 볼 수 있음
	@RequestMapping("view.do")
	public ModelAndView view(int review_bno, HttpSession session) 
			throws Exception{
		//조회수 증가 처리
		reviewService.increaseViewcnt(review_bno, session);
		ModelAndView mav=new ModelAndView();
		mav.setViewName("review/view");//포워딩할 뷰의 이름
		mav.addObject("dto", reviewService.read(review_bno));//자료저장
		return mav; //board/view.jsp로 포워딩
		
	}

	

	//첨부파일 목록을 리턴 : 글 상세보기 페이지(view.jsp)에서 자동실행
	@RequestMapping("getAttach/{review_bno}")
	@ResponseBody
	public List<String> getAttach(@PathVariable int review_bno){
		return reviewService.getAttach(review_bno);
	}
	

	
	
	//게시물 내용 수정
	@RequestMapping("update.do")
	public String update(ReviewDTO dto) throws Exception {
		System.out.println("dto:"+dto);
		if(dto != null) {
			reviewService.update(dto);
		}
		//수정 완료 후 상세 화면으로 이동
		return "redirect:/review/view.do?review_bno="+dto.getReview_bno();
	}
		
	
	//삭제처리
	//삭제 버튼이 눌러지면 아래 url이 들어옴
	@RequestMapping("delete.do")
	public String delete(int review_bno) throws Exception{
		reviewService.delete(review_bno);
		return "redirect:/review/list.do";//목록으로 이동
		
	}				
	
	
	
	
	
	
	}
	
