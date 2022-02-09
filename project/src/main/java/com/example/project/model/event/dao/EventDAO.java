package com.example.project.model.event.dao;

import java.util.List;

import com.example.project.model.event.dto.EventDTO;

public interface EventDAO {

	public List<EventDTO> eventList();
	public void updateEReadCount(int e_num);
	public EventDTO eventViewDetail(int e_num);
	public void insert(EventDTO dto);
	public List<EventDTO> eventListForAdmin();
	public void approve(int e_num);

}
