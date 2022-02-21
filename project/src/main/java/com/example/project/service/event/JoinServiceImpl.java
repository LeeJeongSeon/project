package com.example.project.service.event;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.project.model.event.dao.JoinDAO;

@Service
public class JoinServiceImpl implements JoinService {

	@Inject
	JoinDAO joinDao;
}
