package com.example.project.service.event;

import java.util.List;

import com.example.project.model.event.dto.ReplyDTO;

public interface ReplyService {

	public List<ReplyDTO> list(int er_e_num) throws Exception;

}
