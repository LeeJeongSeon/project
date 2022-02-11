package com.example.project.service.email;

import com.example.project.model.email.EmailDTO;

public interface EmailService {

	public String sendMail(EmailDTO dto);

}