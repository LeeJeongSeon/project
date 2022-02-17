package com.example.project.service.rent;

import java.util.List;

import com.example.project.model.rent.DTO.RentDTO;

public interface RentService {
	public List<RentDTO> listRent(String userid);
	public void insert(RentDTO dto);
	public void delete(int bnum);
	public void update(int bnum);
	public int countRent(String userid, String book_id);
	public void modifyRent(RentDTO dto);
}