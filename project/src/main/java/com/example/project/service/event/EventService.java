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
	public int countEventForAdmin(String list_option, String past) throws Exception;
	public List<EventDTO> eventListForAdmin(String list_option, String past, int start, int end) throws Exception;
	public void result(int e_num, int e_result) throws Exception;
	public int checkEmailEvent(String e_email) throws Exception;
	public List<EventDTO> eventApplyList(String e_email) throws Exception;
	public void update(EventDTO dto) throws Exception;
	public void cancel(int e_num) throws Exception;
	public void delete(int e_num) throws Exception;
	public int countEventJoin() throws Exception;
	public List<EventDTO> eventJoinList(int start, int end) throws Exception;
	public List<EventDTO> eventList() throws Exception;

}
