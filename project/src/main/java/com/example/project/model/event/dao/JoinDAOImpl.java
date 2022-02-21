package com.example.project.model.event.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.project.model.event.dto.JoinDTO;

@Repository
public class JoinDAOImpl implements JoinDAO {

	@Inject
	SqlSession sqlSession;

	@Override
	public List<JoinDTO> joinList() {
		return sqlSession.selectList("join.joinList");
	}

	@Override
	public void insert(int ej_num, String ej_userid) {
		Map<String, Object> map=new HashMap<>();
		map.put("ej_num", ej_num);
		map.put("ej_userid", ej_userid);
		sqlSession.insert("join.joinInsert", map);
	}

}
