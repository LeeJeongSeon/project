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

}
