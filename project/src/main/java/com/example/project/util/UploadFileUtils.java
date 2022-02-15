package com.example.project.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;

public class UploadFileUtils {
	//로깅
	private static final Logger logger
	=LoggerFactory.getLogger(UploadFileUtils.class);

	public static String uploadFile(String uploadPath,
			String originalName, byte[] fileData) throws Exception {
		//uuid 발급
		UUID uid=UUID.randomUUID();
		String savedName = uid.toString()+"_"+originalName;
		//업로드할 디렉토리 생성
		String savedPath = calcPath(uploadPath);
		File target = new File(uploadPath+savedPath, savedName);
		//임시 디렉토리에 업로드된 파일을 지정된 디렉토리로 복사
		FileCopyUtils.copy(fileData, target);
		//파일의 확장자 검사(.다음 마지막 이름이 확장자임을 활용)
		//a.jpg / aaa.bbb.ccc.jpg
		String formatName = originalName.substring(
				originalName.lastIndexOf(".")+1);
		String uploadedFileName = null;
		//이미지 파일인 경우 : 썸네일(작은 이미지)을 생성
		if(MediaUtils.getMediaType(formatName) != null) {
			//썸네일 생성
			uploadedFileName=makeThumbnail(uploadPath, savedPath, savedName);
		}else {//이미지 파일이 아닌경우 : 썸네일은 생성안함
			uploadedFileName=makeIcon(uploadPath, savedPath, savedName);
		}
		return uploadedFileName;

	}//uploadFile()
	



	//File.separator는 이름 구분자로서 예를 들어 윈도우의 경우 upload\\test.txt,
	//리눅스(유닉스)는 upload/test.txt라고 쓰는데 '\', '/'를 따로 신경 안써도
	//"upload"+File.separator+"test.txt"라고 쓰면 OS에 따라 자동으로 처리한다.
	private static String makeIcon(String uploadPath, 
			String path, String fileName) throws Exception {
		String iconName = uploadPath+path+File.separator+fileName;
		return iconName.substring(uploadPath.length()).replace(
				File.separatorChar, '/');
	}

	//썸네일 이미지와 이름 생성
	private static String makeThumbnail(String uploadPath, String path, 
			String fileName) throws Exception {
		//원본 이미지를 읽기 위한 버퍼
		BufferedImage sourceImg = ImageIO.read(
				new File(uploadPath+path, fileName));
		//100픽셀 단위의 썸네일 생성
		BufferedImage destImg = Scalr.resize(sourceImg, 
				Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);
		//썸네일의 이름
		String thumbnailName = uploadPath + path 
				+ File.separator + "s_" +fileName;
		File newFile = new File(thumbnailName);
		String formatName = fileName.substring(
				fileName.lastIndexOf(".")+1);
		//썸네일 생성
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);
		//썸네일의 이름을 리턴
		return thumbnailName.substring(uploadPath.length()).replace(
				File.separatorChar, '/');

	}//makeThumbnail()
	
	//날짜처리 (2022년폴더 / 00월폴더 / 00일폴더)
	private static String calcPath(String uploadPath) {
		Calendar cal = Calendar.getInstance();
		String yearPath = File.separator+cal.get(Calendar.YEAR);
		String monthPath = yearPath + File.separator
				+ new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String datePath = monthPath + File.separator 
				+ new DecimalFormat("00").format(cal.get(Calendar.DATE));
		//디렉토리 생성
		makeDir(uploadPath, yearPath, monthPath, datePath);
		logger.info(datePath);
		return datePath;
	}


	//디렉토리 생성
	private static void makeDir(String uploadPath, String... paths) {
	//String...은 가변사이즈 매개변수 (배열의 요소가 몇개든 상관없이 처리)
		if(new File(paths[paths.length -1]).exists()) {
			return;
		}
		for (String path : paths) {
			File dirPath = new File(uploadPath + path);
			if(!dirPath.exists()) {
				dirPath.mkdir();//디렉토리 생성
			}
		}
		
	}
}