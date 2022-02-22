package com.example.project.service.event;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.project.model.event.dao.JoinDAO;
import com.example.project.model.event.dto.JoinDTO;
import com.example.project.model.member.DTO.MemberDTO;

@Service
public class JoinServiceImpl implements JoinService {

	@Inject
	JoinDAO joinDao;

	@Override
	public List<JoinDTO> joinList() throws Exception {
		return joinDao.joinList();
	}

	@Override
	public void insert(int ej_num, String ej_userid) throws Exception {
		joinDao.insert(ej_num, ej_userid);
	}

	@Override
	public List<MemberDTO> joinMember(int ej_num) throws Exception {
		return joinDao.joinMember(ej_num);
	}

}
