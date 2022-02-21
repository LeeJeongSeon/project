package com.example.project.service.email;

import com.example.project.model.email.EmailDTO;

public interface EmailService {

	public void sendCheckMail(String e_name, String e_email) throws Exception;
	public void sendResultMail(EmailDTO dto) throws Exception;
	public void sendUpdateMail(String e_name, String e_email) throws Exception;
	public void sendCancelMail(String e_name, String e_email) throws Exception;
	public void sendDeleteMail(String e_name, String e_email) throws Exception;
}