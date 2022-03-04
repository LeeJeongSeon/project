package com.example.project.controller.book;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.project.controller.upload.AjaxUploadController;

//upload패키지의 이미지 경로와 다르게 두고 싶어서 따로 컨트롤러 생성
//이미지 경로 : request.getServletContext().getRealPath("WEB-INF/views/images");
//C:\work\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\project\WEB-INF\views\images
@Controller
public class AjacUploadController {
	private static final Logger logger=LoggerFactory.getLogger(AjaxUploadController.class);
	
	
	//이미지 ajax로 받음
		@ResponseBody //객체를 json형식으로 데이터 리턴(서버=>클라이언트)
		@RequestMapping(value = "/uploadBook/uploadAjax", 
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
		@RequestMapping("/uploadBook/displayFile")
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
		@RequestMapping(value = "/uploadBook/deleteFile")
		public ResponseEntity<String> deleteFile(String fileName,HttpServletRequest request){
			String uploadPath=request.getServletContext().getRealPath("WEB-INF/views/images");
			
			//확장자 검사
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			MediaType mType=MediaUtils.getMediaType(formatName);
			if(mType != null) {//이미지 파일 삭제
				//File.separatorChar : 유닉스 / 윈도우즈 \
				new File(uploadPath+(fileName).replace('/', File.separatorChar)).delete();
			}

			return new ResponseEntity<String>("deleted", HttpStatus.OK);
			//uploadAjax.jsp의 if(result=="deleted"){와 연결
		}
}
