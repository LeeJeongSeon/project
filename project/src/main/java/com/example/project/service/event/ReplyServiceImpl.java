package com.example.project.service.event;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.project.model.event.dao.ReplyDAO;
import com.example.project.model.event.dto.ReplyDTO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Inject
	ReplyDAO replyDao;
	
	@Override
	public List<ReplyDTO> list(int er_e_num) throws Exception {
		return replyDao.list(er_e_num);
	}

	@Override
	public List<ReplyDTO> listAdmin() throws Exception {
		return replyDao.listAdmin();
	}

	@Override
	public ReplyDTO viewDetail(int target) throws Exception {
		return replyDao.viewDetail(target);
	}

	@Override
	public void update(int er_num, String er_content) throws Exception {
		replyDao.update(er_num, er_content);
	}

	@Override
	public void delete(int er_num) throws Exception {
		replyDao.delete(er_num);
	}
}
