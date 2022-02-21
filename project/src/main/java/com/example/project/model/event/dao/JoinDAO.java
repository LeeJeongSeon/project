package com.example.project.model.event.dao;

import java.util.List;

import com.example.project.model.event.dto.JoinDTO;

public interface JoinDAO {

	public List<JoinDTO> joinList();
	public List<JoinDTO> joinDetail(int ej_num);

}
