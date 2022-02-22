package com.example.project.service.event;

import java.util.List;

import com.example.project.model.event.dto.JoinDTO;
import com.example.project.model.member.DTO.MemberDTO;

public interface JoinService {

	public List<JoinDTO> joinList() throws Exception;
	public void insert(int ej_num, String ej_userid) throws Exception;
	public List<MemberDTO> joinMember(int ej_num) throws Exception;

}
