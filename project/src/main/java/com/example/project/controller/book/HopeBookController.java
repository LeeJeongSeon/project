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
	
	@RequestMapping("list.do")
	public ModelAndView list(
			@RequestParam(defaultValue = "hopeBook_bookname") String search_option,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "1") int curPage
			)throws Exception{
		
		System.out.println("임시:"+search_option);
		
		//레코드 갯수 계산
		int count=hopeBookSercvie.countArticle(search_option,keyword);
		System.out.println("레코드 갯수:"+count);
		
		//페이지 관련 설정
		Pager pager=new Pager(count, curPage);
		int start=pager.getPageBegin();
		int end=pager.getPageEnd();
		System.out.print("게시물결과:"+start+","+end+"\n");		
		
		List<hopeBookDTO> list=hopeBookSercvie.listAll(search_option,keyword,start,end);
		Map<String, Object> map=new HashMap<>();
		map.put("list", list);
		map.put("count", count);
		map.put("pager", pager);
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		
		System.out.println("임시:"+map);
		
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
	
	@RequestMapping("write.do")
	public ModelAndView write() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("book_list/HopeBook_write");
		return mav;
	}
	
	@RequestMapping("imageUpload.do")
	public void imageUpload(HttpServletRequest request, 
			HttpServletResponse response, @RequestParam 
			MultipartFile upload) throws Exception {
		
		OutputStream out = null;
		PrintWriter printWriter = null;
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		try {
			//업로드한 파일 이름
			String fileName=upload.getOriginalFilename();
			//파일을 바이트 배열로 변환
			byte[] bytes=upload.getBytes();
			//이미지를 업로드할 디렉토리(배포 디렉토리 설정)
			String uploadPath=request.getServletContext().getRealPath("WEB-INF/views/images")+"\\";
			out=new FileOutputStream(new File(uploadPath+fileName));
			//서버로 업로드
			out.write(bytes);
			//클라이언트에 결과 표시
			String callback=request.getParameter("CKEditorFuncNum");
			//서버=>클라이언트로 텍스트 전송(자바스크립트 실행)
			printWriter=response.getWriter();
			String fileUrl=request.getContextPath()+"/images/"+fileName;
			printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
			printWriter.flush();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(out != null) {
					out.close();
				}
				if(printWriter != null) {
					printWriter.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return;
	}
	
	//이미지 ajax로 받음
		@ResponseBody //객체를 json형식으로 데이터 리턴(서버=>클라이언트)
		@RequestMapping(value = "/HopeBook/uploadAjax", 
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
		@RequestMapping("/HopeBook/displayFile")
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
	
		@RequestMapping("insert.do")
		public String insert(@ModelAttribute hopeBookDTO dto) {
			hopeBookSercvie.insertBook(dto);
			return "redirect:/HopeBook/list.do";
		}
		
		@RequestMapping("reply.do")
		public ModelAndView reply(@ModelAttribute hopeBookDTO dto) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("book_list/HopeBook_reply");
			mav.addObject("dto", dto); 
			return mav;
		}
		
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
		
	
		@RequestMapping("hopeBook_check.do")
		@ResponseBody
		public int hopeBook_check(
				@RequestParam String hopeBook_author,
				@RequestParam String hopeBook_bookname
				) {
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
