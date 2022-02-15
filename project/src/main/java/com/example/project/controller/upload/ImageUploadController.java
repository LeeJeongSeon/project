package com.example.project.controller.upload;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;




@Controller
public class ImageUploadController {
	//로깅
		private static final Logger logger
		=LoggerFactory.getLogger(ImageUploadController.class);
	@RequestMapping("imageUpload.do")
	public void imageUpload(HttpServletRequest request, 
			HttpServletResponse response, @RequestParam 
			MultipartFile upload) throws Exception {
		
		OutputStream out = null;
		PrintWriter printWriter = null;
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		
		//지금 하려는 것 : 상품 설명 자체에 이미지를 넣고 싶다.
		///spring02/src/main/java/com/example/spring02/controller/upload/ImageUploadController.java 생성
		

		try {
			//업로드한 파일 이름
			String fileName=upload.getOriginalFilename();
			//파일을 바이트 배열로 변환
			byte[] bytes=upload.getBytes();
			//이미지를 업로드할 디렉토리(배포 디렉토리 설정) : 일렬로 안적어주면 오류남
			String uploadPath="C:\\work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\project\\WEB-INF\\views\\images\\";
			out=new FileOutputStream(new File(uploadPath+fileName));
			//서버로 업로드
			out.write(bytes);
			//클라이언트에 결과 표시
			String callback=request.getParameter("CKEditorFuncNum");
			//서버=>클라이언트로 텍스트 전송(자바스크립트 실행)
			printWriter=response.getWriter();
			String fileUrl=request.getContextPath()+"/images/"+fileName;
			printWriter.println("{\"filename\" : \""+fileName+"\","
					+ " \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
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
}











