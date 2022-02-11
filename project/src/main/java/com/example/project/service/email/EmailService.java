package com.example.project.service.email;

import com.example.project.model.email.EmailDTO;

public interface EmailService {

	public void sendMail(EmailDTO dto) throws Exception;

}