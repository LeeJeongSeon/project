package com.example.project.model.event.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.project.model.event.dto.ReplyDTO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<ReplyDTO> list(int er_e_num) {
		return sqlSession.selectList("reply.list", er_e_num);
	}
	
	@Override
	public List<ReplyDTO> listAdmin() {
		return sqlSession.selectList("reply.listAdmin");
	}

	@Override
	public ReplyDTO viewDetail(int target) {
		return sqlSession.selectOne("reply.viewDetail", target);
	}

	@Override
	public void update(int er_num, String er_content) {
		Map<String, Object> map=new HashMap<>();
		map.put("er_num", er_num);
		map.put("er_content", er_content);
		sqlSession.update("reply.update", map);
	}

	@Override
	public void delete(int er_num) {
		sqlSession.delete("reply.delete", er_num);
	}

}
