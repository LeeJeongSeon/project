package com.example.project.service.member;

import javax.servlet.http.HttpSession;

import com.example.project.model.member.DTO.MemberDTO;



public interface MemberService {

	public boolean loginCheck(MemberDTO dto, HttpSession session);
	public void logout(HttpSession session); 

}
