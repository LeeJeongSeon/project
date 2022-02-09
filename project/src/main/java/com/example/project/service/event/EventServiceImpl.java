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
	public List<EventDTO> eventList() throws Exception {
		return eventDao.eventList();
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
	public void approve(int e_num) throws Exception {
		eventDao.approve(e_num);
	}

}
