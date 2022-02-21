package com.example.project.service.event;

import java.util.List;

import com.example.project.model.event.dto.JoinDTO;

public interface JoinService {

	public List<JoinDTO> joinList() throws Exception;
	public List<JoinDTO> joinDetail(int ej_num) throws Exception;

}
