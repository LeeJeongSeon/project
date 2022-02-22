package com.example.project.service.event;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.example.project.model.event.dao.EventDAO;
import com.example.project.model.event.dto.EventDTO;

@Service
public class EventServiceImpl implements EventService {

	@Inject
	EventDAO eventDao;

	@Override
	public int countEvent(String search_option, String keyword) {
		return eventDao.countEvent(search_option, keyword);
	}
	
	@Override
	public List<EventDTO> eventList(String search_option, String keyword, int start, int end) throws Exception {
		return eventDao.eventList(search_option, keyword, start, end);
	}

	@Override
	public void updateEReadCount(int e_num, HttpSession session) throws Exception{
		long updateTime=0;
		if(session.getAttribute("update_"+e_num)!=null) {
			updateTime=(long)session.getAttribute("update_"+e_num);
		}
		long currentTime=System.currentTimeMillis();
		if(currentTime-updateTime>1000*60*60*24) {
			eventDao.updateEReadCount(e_num);
			session.setAttribute("update_"+e_num, currentTime);
		}
	}

	@Override
	public EventDTO eventViewDetail(int e_num) throws Exception {
		return eventDao.eventViewDetail(e_num);
	}

	@Override
	public void insert(EventDTO dto) throws Exception {
		eventDao.insert(dto);
	}
	
	@Override
	public int countEventForAdmin(String list_option, String past) throws Exception {
		return eventDao.countEventForAdmin(list_option, past);
	}

	@Override
	public List<EventDTO> eventListForAdmin(String list_option, String past, int start, int end) throws Exception {
		return eventDao.eventListForAdmin(list_option, past, start, end);
	}
	
	@Override
	public void result(int e_num, int e_result) throws Exception {
		eventDao.result(e_num, e_result);
	}

	@Override
	public int checkEmailEvent(String e_email) throws Exception {
		return eventDao.checkEmail(e_email);
	}
	
	@Override
	public List<EventDTO> eventApplyList(String e_email) throws Exception {
		return eventDao.eventApplyList(e_email);
	}

	@Override
	public void update(EventDTO dto) throws Exception {
		eventDao.update(dto);
	}

	@Override
	public void cancel(int e_num) throws Exception {
		eventDao.cancel(e_num);
	}

	@Override
	public void delete(int e_num) throws Exception {
		eventDao.delete(e_num);
	}

	@Override
	public int countEventJoin() throws Exception {
		return eventDao.countEventJoin();
	}

	@Override
	public List<EventDTO> eventJoinList(int start, int end) throws Exception {
		return eventDao.eventJoinList(start, end);
	}

	@Override
	public List<EventDTO> eventList() throws Exception {
		return eventDao.eventList();
	}

}
