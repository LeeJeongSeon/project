package com.example.project.service.event;

import javax.inject.Inject;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.example.project.model.event.dto.EventEmailDTO;

@Service
public class EventEmailServiceImpl implements EventEmailService {

	@Inject
	JavaMailSender mailSender;
	
	@Override
	public String sendMail(EventEmailDTO dto) {
		String message="";
		try {
			MimeMessage msg=mailSender.createMimeMessage();
			msg.addRecipient(RecipientType.TO, new InternetAddress(dto.getReceiveMail()));
			msg.addFrom(new InternetAddress[] {new InternetAddress(dto.getSenderMail(), dto.getSenderName())});
			msg.setSubject(dto.getSubject(), "utf-8");
			msg.setText(dto.getMessage(), "utf-8");
			mailSender.send(msg);
			message="성공";
		} catch (Exception e) {
			e.printStackTrace();
			message="실패";
		}
		return message;
	}
	
}
