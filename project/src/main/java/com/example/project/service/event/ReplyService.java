package com.example.project.service.event;

import java.util.List;

import com.example.project.model.event.dto.ReplyDTO;

public interface ReplyService {

	public List<ReplyDTO> list(int er_e_num) throws Exception;
	public List<ReplyDTO> listAdmin() throws Exception;
	public ReplyDTO viewDetail(int target) throws Exception;
	public void update(int er_num, String er_content) throws Exception;
	public void delete(int er_num) throws Exception;

}
