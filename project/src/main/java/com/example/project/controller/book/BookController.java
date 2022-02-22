package com.example.project.controller.book;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
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

import com.example.project.model.book.VO.book_check;
import com.example.project.model.book.dto.bookDTO;
import com.example.project.service.book.BookService;
import com.example.project.service.book.Pager;


@Controller
@RequestMapping("book/*")
public class BookController {

	@Inject
	BookService bookService;
	
	//업로드 디렉토리
	//@Resource(name = "uploadPath")
	//String uploadPath;
	
	//도서 목록 조회
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
	
	//도서목록 인기순
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
	
	//페이지이동
	@RequestMapping("book_write.do")
	public String book_insert() {
		return "book_list/book_insert";
	}
	
	//이미지 ajax로 받음
	@ResponseBody //객체를 json형식으로 데이터 리턴(서버=>클라이언트)
	@RequestMapping(value = "/book/uploadAjax", 
	method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file,HttpServletRequest request)
			throws Exception {
		String uploadPath=request.getServletContext().getRealPath("WEB-INF/views/images");
		System.out.print("상대경로:"+uploadPath+"\n");
		
		return new ResponseEntity<String>(
				UploadFileUtils.uploadFile(uploadPath, 
						file.getOriginalFilename(), file.getBytes()), HttpStatus.OK);
		
	}
	
	//이미지 이름 출력
	@ResponseBody //view가 아닌 data리턴
	@RequestMapping("/book/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName,HttpServletRequest request) 
			throws Exception {
		String uploadPath=request.getServletContext().getRealPath("WEB-INF/views/images");
		
		//서버의 파일을 다운로드하기 위한 스트림
		InputStream in = null; //java.io
		ResponseEntity<byte[]> entity = null;
		try {
			//확장자 검사
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			//헤더 구성 객체
			HttpHeaders headers = new HttpHeaders();
			//InputStream 생성
			in = new FileInputStream(uploadPath + fileName);
			fileName = fileName.substring(fileName.indexOf("_")+1);
			//다운로드용 컨텐츠 타입
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			//iso-8859-1 서유럽언어
			headers.add("Content-Disposition", "attachment; filename=\"" 
					+ new String(fileName.getBytes("utf-8"), "iso-8859-1") + "\"");
			//바이트배열, 헤더, 상태코드 3개를 묶어서 전달
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			if(in != null)
				in.close();
		}
		return entity;
	}//displayFile()
	
	//이미지 삭제
	@ResponseBody
	@RequestMapping(value = "/book/deleteFile")
	public ResponseEntity<String> deleteFile(String fileName,HttpServletRequest request){
		String uploadPath=request.getServletContext().getRealPath("WEB-INF/views/images");
		
		//확장자 검사
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		MediaType mType=MediaUtils.getMediaType(formatName);
		if(mType != null) {//이미지 파일의 원본이미지 삭제
			String front=fileName.substring(0, 12);
			String end=fileName.substring(14);//14~끝까지
			//File.separatorChar : 유닉스 / 윈도우즈 \
			new File(uploadPath+(front+end).replace('/', File.separatorChar)).delete();
		}

		return new ResponseEntity<String>("deleted", HttpStatus.OK);
		//uploadAjax.jsp의 if(result=="deleted"){와 연결
	}
	
	//도서추가
	@RequestMapping("book_insert.do")
	public String insert(@ModelAttribute bookDTO dto,HttpServletRequest request) {
		//String uploadPath="C:\\work\\project\\project\\src\\main\\webapp\\WEB-INF\\views\\images"; //개발디렉토리
		//베포디렉토리는 컴퓨터마다 이미지폴더가 초기화됨. 
		String uploadPath=request.getServletContext().getRealPath("WEB-INF/views/images")+"\\"; //베포디렉토리

		if(dto.getBook_img()=="") {
			String filename="-";
			dto.setBook_img(filename);
		}
		String filename=dto.getBook_img();
		if(!dto.getFile().isEmpty()) {
			filename=dto.getFile().getOriginalFilename();
			try {
				new File(uploadPath).mkdir();
				dto.getFile().transferTo(new File(uploadPath+filename));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		dto.setBook_img(filename);

		bookService.insertBook(dto);
		return "redirect:/book/list.do";
	}
	
	//도서수정페이지로 이동
	@RequestMapping("book_edit.do")
	public ModelAndView book_edit(@RequestParam String id) throws Exception{
		int book_id=Integer.parseInt(id);
		ModelAndView mav=new ModelAndView();
		mav.setViewName("book_list/book_edit");
		mav.addObject("dto", bookService.read(book_id));
		System.out.println("임시:"+mav);
		return mav;		
	}
	
	//도서수정
	@RequestMapping("book_update.do")
	public String book_update(@ModelAttribute bookDTO dto,HttpServletRequest request) throws Exception{
		String uploadPath=request.getServletContext().getRealPath("WEB-INF/views/images")+"\\"; //베포디렉토리
		System.out.println("임시:"+dto+"\n");
		
		String filename="-";
		//첨부파일이 있으면
		if(!dto.getFile().isEmpty()) { //파일첨부로 이미지를 받아옴
			filename=dto.getFile().getOriginalFilename();
			try {
				new File(uploadPath).mkdir();
				dto.getFile().transferTo(new File(uploadPath+filename));
			} catch (Exception e) {
				e.printStackTrace();
			}
			dto.setBook_img(filename);
		}else if(dto.getBook_img()!=null){ //ajax로 이미지를 받아옴 
			System.out.println("실행중입니다.");
		}
		else {//새로운 첨부 파일이 없을 때
			//기존에 첨부한 파일 정보를 가져옴
			bookDTO dto2=bookService.read(dto.getBook_id());
			dto.setBook_img(dto2.getBook_img());
		}
		bookService.updateBook(dto);

		return "redirect:/book/list.do";		
	}
	
	@RequestMapping("book_delete.do")
	public String book_delete(HttpServletRequest request,@RequestParam int book_id) {
		String uploadPath=request.getServletContext().getRealPath("WEB-INF/views/images")+"\\"; //베포디렉토리
		System.out.println("삭제넘버:"+book_id);
		//첨부파일 삭제
		bookDTO dto=bookService.read(book_id);
		String filename=dto.getBook_img();
		if(filename != null && !filename.equals("-")) {
			File f=new File(uploadPath+filename);
			System.out.println("파일존재여부 :"+f.exists());
			if(f.exists()) {//파일이 존재하면
				f.delete();//파일 목록 삭제
				System.out.println("삭제되었습니다.");
			}
		}
		bookService.deleteBook(book_id);
		return "redirect:/book/list.do";	
	}
	
	@RequestMapping("book_recommend.do")
	public ModelAndView book_recommend() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("book_list/book_recommend");
		return mav;
	}
	
	//도서 랜덤 추천
	@RequestMapping("book_random_recommend.do")
	public ModelAndView book_random_recommend(HttpSession session) {
		String userid=(String)session.getAttribute("userid");
		List<bookDTO> list=bookService.book_random_recommend(userid);
		
		ModelAndView mav=new ModelAndView();
		Map<String, Object> map=new HashMap<>();
		map.put("list", list);
		mav.setViewName("book_list/rendom_recommend");
		mav.addObject("map", map); 
		return mav;
	}
	
	//도서 추천
		@RequestMapping("book_other_recommend.do")
		public ModelAndView book_other_recommend(HttpSession session) {
			String userid=(String)session.getAttribute("userid");
			List<bookDTO> list=bookService.book_other_recommend(userid);
			System.out.print("리스트:"+list);
			
			ModelAndView mav=new ModelAndView();
			Map<String, Object> map=new HashMap<>();
			map.put("list", list);
			mav.setViewName("book_list/other_recommend");
			mav.addObject("map", map); 
			return mav;
		}
	
	//index페이지
	@RequestMapping("book_index.do")
	public ModelAndView book_index() {
		List<bookDTO> list=bookService.book_index();
		System.out.print("리스트:"+list);
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("book_list/book_index");
		mav.addObject("list", list); 
		return mav;
	}
}
