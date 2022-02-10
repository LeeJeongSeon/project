package com.example.project.model.member.DAO;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.project.model.member.DTO.MemberDTO;




@Repository//DAO선언
public class MemberDAOImpl implements MemberDAO {
	
	@Inject
	SqlSession sqlSession;//SqlSession 의존관계 주입

	@Override
	public boolean loginCheck(MemberDTO dto) {
		
		String name=sqlSession.selectOne("member.login_check", dto);
		
		return (name==null)? false : true;
	}

}
