package com.example.project.service.review;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.project.model.review.dao.ReviewDAO;
import com.example.project.model.review.dto.ReviewDTO;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Inject
	ReviewDAO reviewDao;
	
	@Override
	public void deleteFile(String review_fullName) {
		reviewDao.deleteFile(review_fullName);

	}

	@Override
	public List<String> getAttach(int review_bno) {
		return reviewDao.getAttach(review_bno);
	}

	@Override
	public void addAttach(String fullName) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateAttach(String fullName, int review_bno) {
		// TODO Auto-generated method stub

	}

	@Transactional
	@Override
	public void create(ReviewDTO dto) throws Exception {
		//board 테이블에 레코드 추가
		reviewDao.create(dto);
		//attach 테이블에 레코드 추가
		String[] files=dto.getReview_files();//첨부파일 이름 배열
		if(files==null) return; //첨부파일이 없으면 skip
		for(String name : files) {
			reviewDao.addAttach(name);
		}
	}

	
	
	@Transactional
	@Override
	public void update(ReviewDTO dto) throws Exception {
		reviewDao.update(dto);
		String[] files=dto.getReview_files();//첨부파일 이름 배열
		if(files==null) return; //첨부파일이 없으면 skip
		for(String name : files) {
			System.out.println("첨부파일 이름 :" + name);
			reviewDao.updateAttach(name, dto.getReview_bno());
		}

	}

	
	
	
	@Transactional
	@Override
	public void delete(int review_bno) throws Exception {
		reviewDao.delete(review_bno);

	}

	@Override
	public List<ReviewDTO> listAll(String search_option, String keyword, int start, int end) throws Exception {
		return reviewDao.listAll(search_option, keyword, start, end);
	}

	@Override
	public void increaseViewcnt(int review_bno, HttpSession session) throws Exception {
		long update_time=0;
		if(session.getAttribute("update_time_"+review_bno)!=null) {
			//최근에 조회수를 올린 시간
			update_time=(long)session.getAttribute("update_time_"+review_bno);
		}
		long current_time=System.currentTimeMillis();
		//일정시간(5초)이 경과한 후 조회수 증가 처리
		if(current_time - update_time > 5*1000) {//24*60*60*1000(하루)
			//조회수 증가 처리
			reviewDao.increaseViewcnt(review_bno);
			//조회수를 올린 시간 저장
			session.setAttribute("update_time_"+review_bno, current_time);
		}

	}

	@Override
	public int countArticle(String search_option, String keyword) throws Exception {
		return reviewDao.countArticle(search_option,keyword);
	}

	@Override
	public ReviewDTO read(int review_bno) throws Exception {
		return reviewDao.read(review_bno);
	}

}
