package com.example.project.model.event.dao;

import java.util.List;

import com.example.project.model.event.dto.ReplyDTO;

public interface ReplyDAO {

	public List<ReplyDTO> list(int er_e_num);

}
