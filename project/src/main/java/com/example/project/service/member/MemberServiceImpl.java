package com.example.project.service.member;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.example.project.model.member.DAO.MemberDAO;
import com.example.project.model.member.DTO.MemberDTO;



@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	MemberDAO memberDAO;

	@Override
	public boolean loginCheck(MemberDTO dto, HttpSession session) {
		boolean result = memberDAO.loginCheck(dto);
		if(result) {//세션변수 저장
			session.setAttribute("userid", dto.getUserid());
			session.setAttribute("name", dto.getName());
			
		}
		return result;
	}

	@Override
	public void logout(HttpSession session) {
		session.invalidate();//세션초기화

	}

}
