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
	public int countEventForAdmin(String list_option, String past) {
		Map<String, String> map = new HashMap<>();
		map.put("list_option", list_option);
		map.put("past", past);
		return sqlSession.selectOne("event.countEventForAdmin", map);
	}

	@Override
	public List<EventDTO> eventListForAdmin(String list_option, String past, int start, int end) {
		Map<String, Object> map = new HashMap<>();
		map.put("list_option", list_option);
		map.put("past", past);
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("event.eventListForAdmin", map);
	}
	
	@Override
	public void result(int e_num, int e_result) {
		Map<String, Object> map = new HashMap<>();
		map.put("e_num", e_num);
		map.put("e_result", e_result);
		sqlSession.update("event.result", map);
	}

	@Override
	public int checkEmail(String e_email) {
		return sqlSession.selectOne("event.checkEmail", e_email);
	}
	
	@Override
	public List<EventDTO> eventApplyList(String e_email) {
		return sqlSession.selectList("event.eventApplyList", e_email);
	}

	@Override
	public void update(EventDTO dto) {
		sqlSession.update("event.update", dto);
	}

	@Override
	public void cancel(int e_num) {
		sqlSession.update("event.cancel", e_num);
	}

	@Override
	public void delete(int e_num) {
		sqlSession.delete("event.delete", e_num);
	}

	@Override
	public int countEventJoin() {
		return sqlSession.selectOne("event.countEventJoin");
	}

	@Override
	public List<EventDTO> eventJoinList(int start, int end) {
		Map<String, Object> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("event.eventJoinList", map);
	}

	@Override
	public List<EventDTO> eventList() {
		return sqlSession.selectList("event.listALL");
	}

}
