package com.example.project.model.event.dao;

import java.util.List;

import com.example.project.model.event.dto.ReplyDTO;

public interface ReplyDAO {

	public List<ReplyDTO> list(int er_e_num);
	public List<ReplyDTO> listAdmin();
	public ReplyDTO viewDetail(int target);
	public void update(int er_num, String er_content);
	public void delete(int er_num);

}
