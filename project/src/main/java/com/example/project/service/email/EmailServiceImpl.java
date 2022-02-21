package com.example.project.service.email;

import javax.inject.Inject;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.example.project.model.email.EmailDTO;

@Service
public class EmailServiceImpl implements EmailService {

	@Inject
	JavaMailSender mailSender;
	
	@Override
	public void sendCheckMail(String e_name, String e_email) throws Exception {
		EmailDTO dto=new EmailDTO();
		MimeMessage msg = mailSender.createMimeMessage();
		msg.addRecipient(RecipientType.TO, new InternetAddress(e_email));
		msg.addFrom(new InternetAddress[] { new InternetAddress(dto.getSenderMail(), "행사관리자") });
		msg.setSubject("안녕하세요 도서관입니다.", "utf-8");
		msg.setText("\'"+e_name+"\' 행사 신청 접수가 완료되었습니다. 영업일 기준 7일 내 승인 / 반려 처리가 완료됩니다. 반려 시 이메일이 발송되며, 해당 메일은 확인용 메일임을 알려드립니다. 행사 내용 변경을 원하실 경우 사이트를 재 방문해주세요. 감사합니다. 좋은 하루 되세요:)", "utf-8");
		mailSender.send(msg);
	}

	@Override
	public void sendResultMail(EmailDTO dto) throws Exception {
		MimeMessage msg = mailSender.createMimeMessage();
		msg.addRecipient(RecipientType.TO, new InternetAddress(dto.getReceiveMail()));
		msg.addFrom(new InternetAddress[] { new InternetAddress(dto.getSenderMail(), "행사관리자") });
		msg.setSubject(dto.getSubject(), "utf-8");
		msg.setText(dto.getMessage(), "utf-8");
		mailSender.send(msg);
	}

	@Override
	public void sendUpdateMail(String e_name, String e_email) throws Exception {
		EmailDTO dto=new EmailDTO();
		MimeMessage msg = mailSender.createMimeMessage();
		msg.addRecipient(RecipientType.TO, new InternetAddress(e_email));
		msg.addFrom(new InternetAddress[] { new InternetAddress(dto.getSenderMail(), "행사관리자") });
		msg.setSubject("안녕하세요 도서관입니다.", "utf-8");
		msg.setText("\'"+e_name+"\' 행사 변경 접수가 완료되었습니다. 영업일 기준 7일 내 승인 / 반려 처리가 완료됩니다. 반려 시 이메일이 발송되며, 해당 메일은 확인용 메일임을 알려드립니다. 행사 내용 변경을 원하실 경우 사이트를 재 방문해주세요. 감사합니다. 좋은 하루 되세요:)", "utf-8");
		mailSender.send(msg);
	}

	@Override
	public void sendCancelMail(String e_name, String e_email) throws Exception {
		EmailDTO dto=new EmailDTO();
		MimeMessage msg = mailSender.createMimeMessage();
		msg.addRecipient(RecipientType.TO, new InternetAddress(e_email));
		msg.addFrom(new InternetAddress[] { new InternetAddress(dto.getSenderMail(), "행사관리자") });
		msg.setSubject("안녕하세요 도서관입니다.", "utf-8");
		msg.setText("\'"+e_name+"\' 행사 신청 취소가 완료되었으며 해당 메일은 확인용 메일입니다. 더불어 취소 상태의 행사는 관리자가 무통보 삭제 처리할 수 있음을 알려드립니다. 감사합니다. 좋은 하루 되세요:)", "utf-8");
		mailSender.send(msg);
	}

	@Override
	public void sendDeleteMail(String e_name, String e_email) throws Exception {
		EmailDTO dto=new EmailDTO();
		MimeMessage msg = mailSender.createMimeMessage();
		msg.addRecipient(RecipientType.TO, new InternetAddress(e_email));
		msg.addFrom(new InternetAddress[] { new InternetAddress(dto.getSenderMail(), "행사관리자") });
		msg.setSubject("안녕하세요 도서관입니다.", "utf-8");
		msg.setText("\'"+e_name+"\' 행사 신청내역 삭제처리가 완료되었으며 해당 메일은 확인용 메일입니다. 관련된 모든 정보가 삭제되었으며, 수정이 불가능함을 알려드립니다. 감사합니다. 좋은 하루 되세요:)", "utf-8");
		mailSender.send(msg);
	}

}