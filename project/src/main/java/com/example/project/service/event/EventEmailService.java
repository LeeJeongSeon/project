package com.example.project.service.event;

import com.example.project.model.event.dto.EventEmailDTO;

public interface EventEmailService {

	public String sendMail(EventEmailDTO dto);

}