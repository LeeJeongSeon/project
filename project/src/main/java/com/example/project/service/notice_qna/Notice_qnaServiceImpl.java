package com.example.project.service.notice_qna;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.example.project.model.notice_qna.dao.Notice_qnaDAO;
import com.example.project.model.notice_qna.dto.Notice_qnaDTO;



@Service
public class Notice_qnaServiceImpl implements Notice_qnaService {
	
	@Inject
	Notice_qnaDAO notice_qnaDao;

	@Override
	public List<Notice_qnaDTO> list(String cate, int start, int end,String search_option, String keyword) throws Exception {
		return notice_qnaDao.list(cate,start,end,search_option,keyword);
	}

	@Override
	public int listCount(String cate,String search_option,String keyword) throws Exception {
		return notice_qnaDao.listCount(cate,search_option,keyword);
	}

	@Override
	public List<Notice_qnaDTO> noticeList() throws Exception{
		return notice_qnaDao.noticeList();
	}

	@Override
	public void create(Notice_qnaDTO dto) throws Exception{
		notice_qnaDao.create(dto);
	}

	@Override
	public void viewCount(int num, HttpSession session)throws Exception {
		long update_time=0;
		if(session.getAttribute("update_time_"+num)!=null) {
			//최근에 조회수를 올린 시간
			update_time=(long)session.getAttribute("update_time_"+num);
		}
		long current_time=System.currentTimeMillis();
		//일정시간(5초)이 경과한 후 조회수 증가 처리
		if(current_time - update_time > 24*60*60*1000) {//24*60*60*1000(하루)
			//조회수 증가 처리
			notice_qnaDao.viewCount(num);
			//조회수를 올린 시간 저장
			session.setAttribute("update_time_"+num, current_time);
	    }
	}

	@Override
	public Notice_qnaDTO view(int num) throws Exception {
		return notice_qnaDao.view(num);
	}

	@Override
	public void noticeNy(int num, String notice) throws Exception {
		notice_qnaDao.noticeNy(num,notice);
	}

	@Override
	public void delete(int num) throws Exception {
		notice_qnaDao.delete(num);
	}

	@Override
	public void update(Notice_qnaDTO dto) throws Exception {
		notice_qnaDao.update(dto);
	}

	@Override
	public void updateStep(int ref, int ref_step) throws Exception {
	 	notice_qnaDao.updateStep(ref,ref_step);
	}

	@Override
	public void reply(Notice_qnaDTO dto) throws Exception {
		notice_qnaDao.reply(dto);
	}

	

}
