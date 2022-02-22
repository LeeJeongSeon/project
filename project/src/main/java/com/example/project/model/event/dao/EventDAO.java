package com.example.project.model.event.dao;

import java.util.List;

import com.example.project.model.event.dto.EventDTO;

public interface EventDAO {

	public int countEvent(String search_option, String keyword);
	public List<EventDTO> eventList(String search_option, String keyword, int start, int end);
	public void updateEReadCount(int e_num);
	public EventDTO eventViewDetail(int e_num);
	public void insert(EventDTO dto);
	public int countEventForAdmin(String list_option, String past);
	public List<EventDTO> eventListForAdmin(String list_option, String past, int start, int end);
	public void result(int e_num, int e_result);
	public int checkEmail(String e_email);
	public List<EventDTO> eventApplyList(String e_email);
	public void update(EventDTO dto);
	public void cancel(int e_num);
	public void delete(int e_num);
	public int countEventJoin();
	public List<EventDTO> eventJoinList(int start, int end);
	public List<EventDTO> eventList();

}
