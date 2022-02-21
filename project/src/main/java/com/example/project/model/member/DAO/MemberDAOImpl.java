package com.example.project.model.member.DAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.project.model.member.DTO.MemberDTO;
import com.example.project.model.rent.DTO.RentDTO;




@Repository//DAO선언
public class MemberDAOImpl implements MemberDAO {
	
	@Inject
	SqlSession sqlSession;//SqlSession 의존관계 주입

	
	@Override//로그인 체크
	public boolean loginCheck(MemberDTO dto) {
		
		String name=sqlSession.selectOne("member.login_check", dto);
		
		return (name==null)? false : true;
	}

	@Override//회원 가입
	public void insertMember(MemberDTO dto) {
		sqlSession.insert("member.insertMember", dto);
		
	}

	@Override//희원 수정
	public MemberDTO viewMember(String userid) {
		return sqlSession.selectOne("member.viewMember", userid);
	}

	@Override//회원정보 업데이트
	public void updateMember(MemberDTO dto) {
		sqlSession.update("member.updateMember", dto);
		
	}

	@Override//회원정보 삭제
	public void deleteMember(String userid) {
		sqlSession.delete("member.deleteMember", userid);
		
	}

	@Override//회원정보 수정 비밀번호체크
	public boolean checkPw(String userid, String passwd) {
		boolean result=false;
		Map<String,String> map=new HashMap<>();
		map.put("userid", userid);
		map.put("passwd", passwd);
		int count=sqlSession.selectOne("member.checkPw", map);
		//비번이 맞으면(1), 틀리면(0)리턴
		if(count==1) result=true;
		return result;
	}
	
	//여기서부터 관리자 단
	
	//회원수
	@Override
	public int countMember(String search_option, String keyword) throws Exception {

		Map<String,String> map=new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", "%"+keyword+"%");
		return sqlSession.selectOne("member.countMember",map);
		
	}

	
	//회원 리스트
	@Override
	public List<MemberDTO> listMember(String search_option, String keyword, int start, int end) {
		Map<String,Object> map=new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", "%"+keyword+"%");
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("member.listMember", map);
	}

	
	//회원 정보
	@Override
	public MemberDTO readMember(String userid) throws Exception {
		return sqlSession.selectOne("member.readMember", userid);
	}

	@Override
	public int adminCheck(String userid) {
		return sqlSession.selectOne("member.adminCheck",userid);
	}
	

	
    


}
