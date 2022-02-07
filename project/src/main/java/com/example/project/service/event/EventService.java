package com.example.project.service.event;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.example.project.model.event.dto.EventDTO;

public interface EventService {

	public List<EventDTO> eventList() throws Exception;
	public void updateEReadCount(int e_num, HttpSession session) throws Exception;
	public EventDTO eventViewDetail(int e_num) throws Exception;
	public void insert(EventDTO dto) throws Exception;

}
