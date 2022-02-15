package com.example.project.model.notice_qna.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.example.project.model.notice_qna.dto.Notice_qnaDTO;




public interface Notice_qnaDAO {

	public List<Notice_qnaDTO> list(String cate, int start, int end,String search_option, String keyword )throws Exception;
	public int listCount(String cate, String search_option, String keyword)throws Exception;
	public List<Notice_qnaDTO> noticeList()throws Exception;
	public void create(Notice_qnaDTO dto)throws Exception;
	public void viewCount(int num)throws Exception;
	public Notice_qnaDTO view(int num) throws Exception;
	public void noticeNy(int num, String notice)throws Exception;
	public void delete(int num) throws Exception;
	public void update(Notice_qnaDTO dto) throws Exception;
	public void updateStep(int ref, int ref_step) throws Exception;
	public void reply(Notice_qnaDTO dto) throws Exception;

}
