package com.example.project.model.event.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.project.model.event.dto.EventDTO;

@Repository
public class EventDAOImpl implements EventDAO {
	
	@Inject
	SqlSession sqlSession;

	@Override
	public List<EventDTO> eventList() {
		return sqlSession.selectList("event.eventList");
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
	public void approve(int e_num) {
		sqlSession.update("event.approve", e_num);
	}

}
