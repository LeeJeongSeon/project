package com.example.project.service.rent;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.project.model.rent.DAO.RentDAO;
import com.example.project.model.rent.DTO.RentDTO;

@Service
public class RentServiceImpl implements RentService {
	
	@Inject
	RentDAO rentDao;
	
	@Override
	public void insert(RentDTO dto) {
		rentDao.insert(dto);
	}
	
	@Override
	public List<RentDTO> listRent(String userid) {
		return rentDao.listRent(userid);
	}
	
	@Override
	public List<RentDTO> listRentN(String userid) {
		return rentDao.listRentN(userid);
	}
	
	@Override
	public void re(int bnum) {
		rentDao.re(bnum);
	}
	
	
	@Override
	public void update(int bnum) {
		
	}
	
	@Override
	public void delete(int bnum) {
		rentDao.delete(bnum);
	}
	
	@Override
	public int countRent(String userid, String book_id) {
		return 0;
	}
	
	@Override
	public void modifyRent(RentDTO dto) {
		rentDao.modifyRent(dto);
	}
	
	@Override
	public void extend(int bnum) {
		rentDao.extend(bnum);
	}
	
	@Override
	public void show(int bnum) {
		rentDao.show(bnum);
	}
}
