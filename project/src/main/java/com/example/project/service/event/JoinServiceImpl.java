package com.example.project.service.event;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.project.model.event.dao.JoinDAO;
import com.example.project.model.event.dto.JoinDTO;

@Service
public class JoinServiceImpl implements JoinService {

	@Inject
	JoinDAO joinDao;

	@Override
	public List<JoinDTO> joinList() throws Exception {
		return joinDao.joinList();
	}

	@Override
	public List<JoinDTO> joinDetail(int ej_num) throws Exception {
		return joinDao.joinDetail(ej_num);
	}
}
