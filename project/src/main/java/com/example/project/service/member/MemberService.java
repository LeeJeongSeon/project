package com.example.project.service.member;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.example.project.model.member.DTO.MemberDTO;
import com.example.project.model.rent.DTO.RentDTO;



public interface MemberService {

	public boolean loginCheck(MemberDTO dto, HttpSession session);//로그인체크
	public void logout(HttpSession session); //로그아웃
	public void insertMember(MemberDTO dto); // 회원가입
	public MemberDTO viewMember(String userid);//회원정보 수정
	public void updateMember(MemberDTO dto); // 회원정보 업데이트
	public void deleteMember(String userid);// 회원정보 삭제
	public boolean checkPw(String userid, String passwd);//회원정보 패스워드체크
	
	//관리자 단
	public int countMember(String search_option, String keyword) throws Exception;//레코드 갯수 계산
	public List<MemberDTO> listMember(String search_option, String keyword, int start, int end);
	public MemberDTO readMember(String userid) throws Exception;
	public int adminCheck(String userid);
	

}
