package com.example.project.service.member;

import java.io.PrintWriter;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.example.project.model.member.DAO.MemberDAO;
import com.example.project.model.member.DTO.MemberDTO;



@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	MemberDAO memberDAO;
	
	@Override//로그인체크
	public boolean loginCheck(MemberDTO dto, HttpSession session) {
		boolean result = memberDAO.loginCheck(dto);
		if(result) {//세션변수 저장
			MemberDTO dto2=viewMember(dto.getUserid());
			session.setAttribute("userid", dto.getUserid());
			session.setAttribute("adminCk", dto2.getAdminCk());
			session.setAttribute("name", dto2.getName());
			
		}
		return result;
	}

	@Override//로그아웃
	public void logout(HttpSession session) {
		session.invalidate();//세션초기화

	}

	@Override//회원가입
	public void insertMember(MemberDTO dto) {
		memberDAO.insertMember(dto);
		
	}

	@Override//회원정보수정
	public MemberDTO viewMember(String userid) {
		return memberDAO.viewMember(userid);
	}

	@Override//회원정보 업데이트
	public void updateMember(MemberDTO dto) {
		memberDAO.updateMember(dto);
		
	}

	
	@Override//회원정보 삭제
	public void deleteMember(String userid) {
		memberDAO.deleteMember(userid);
		
	}

	@Override//회원정보 패스워드체크
	public boolean checkPw(String userid, String passwd) {
		return memberDAO.checkPw(userid, passwd);
	}
	
	@Override//아이디 찾기
	public MemberDTO find_id(HttpServletResponse response, String email, String name) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		MemberDTO id = memberDAO.find_id(email, name);

		if (id == null) {
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else {
			return id;
		}
	}

	@Override//비밀번호찾기
	public String pwChange(String userid, String email) {
		return memberDAO.pwChange(userid,email);


	}

	@Override//아이디 중복검사
	public int idCheck(String userid) {
		int cnt = memberDAO.idCheck(userid);
		return cnt;
	}
	
	@Override//비밀번호 변경
	public void pwUpdate(String userid, String passwd) throws Exception {
		memberDAO.pwUpdate(userid, passwd);
		
	}
	
	
	
	//여기서부터 관리자 단
	
	//회원수
	@Override
	public int countMember(String search_option, String keyword) throws Exception {
		return memberDAO.countMember(search_option,keyword);
	}

	//회원 리스트
	@Override
	public List<MemberDTO> listMember(String search_option, String keyword, int start, int end) {
		return memberDAO.listMember(search_option, keyword, start, end);
	}

	//회원 정보 보기
	@Override
	public MemberDTO readMember(String userid) throws Exception {
		return memberDAO.readMember(userid);
	}

	@Override
	public int adminCheck(String userid) {
		return memberDAO.adminCheck(userid);
	}

	

	
}
