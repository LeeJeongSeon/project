package com.example.project.model.event.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.project.model.event.dto.EventDTO;

@Repository
public class EventDAOImpl implements EventDAO {
	
	@Inject
	SqlSession sqlSession;

	@Override
	public int countEvent(String search_option, String keyword) {
		Map<String,String> map = new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", "%"+keyword+"%");
		return sqlSession.selectOne("event.countEvent", map);
	}
	
	@Override
	public List<EventDTO> eventList(String search_option, String keyword, int start, int end) {
		Map<String, Object> map = new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", "%"+keyword+"%");
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("event.eventList", map);
	}

	@Override
	public void updateEReadCount(int e_num) {
		sqlSession.update("event.updateEReadCount", e_num);
	}

	@Override
	public EventDTO eventViewDetail(int e_num) {
		return sqlSession.selectOne("event.eventViewDetail", e_num);
	}

	@Override
	public void insert(EventDTO dto) {
		sqlSession.insert("event.insert", dto);
	}

	@Override
	public List<EventDTO> eventListForAdmin() {
		return sqlSession.selectList("event.eventListForAdmin");
	}
	
	@Override
	public void approve(int e_num) {
		sqlSession.update("event.approve", e_num);
	}

}
