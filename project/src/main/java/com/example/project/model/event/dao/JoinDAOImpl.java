package com.example.project.model.event.dao;

import java.util.List;

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
}
