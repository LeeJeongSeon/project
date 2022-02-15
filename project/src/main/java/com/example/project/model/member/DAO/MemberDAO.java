package com.example.project.model.member.DAO;

import com.example.project.model.member.DTO.MemberDTO;

public interface MemberDAO {

	public boolean loginCheck(MemberDTO dto);//로그인체크
	public void insertMember(MemberDTO dto);//회원가입
	public MemberDTO viewMember(String userid);//회원정보 수정
	public void updateMember(MemberDTO dto);//회원정보 업데이트
	public void deleteMember(String userid);//회원정보 삭제
	public boolean checkPw(String userid, String passwd);//회원정보 수정 패스워드 체크
	
	
	
	
} 

