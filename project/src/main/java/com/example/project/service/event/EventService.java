package com.example.project.service.event;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.example.project.model.event.dto.EventDTO;

public interface EventService {

	public int countEvent(String search_option, String keyword);
	public List<EventDTO> eventList(String search_option, String keyword, int start, int end) throws Exception;
	public void updateEReadCount(int e_num, HttpSession session) throws Exception;
	public EventDTO eventViewDetail(int e_num) throws Exception;
	public void insert(EventDTO dto) throws Exception;
	public List<EventDTO> eventListForAdmin() throws Exception;
	public void result(int e_num, int e_result) throws Exception;

}
