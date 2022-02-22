package com.example.project.model.rent.DAO;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.project.model.rent.DTO.RentDTO;

@Repository
public class RentDAOImpl implements RentDAO {
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<RentDTO> listRent(String userid){
		return sqlSession.selectList("rent.listRent", userid);
	}
	
	@Override
	public List<RentDTO> listRentN(String userid){
		return sqlSession.selectList("rent.listRentN", userid);
	}

	@Override
	public void insert(RentDTO dto) {
		sqlSession.insert("rent.insert", dto);
	}
	
	
	@Override
	public void re(int bnum) {
		sqlSession.update("rent.re", bnum);
	}
	
	@Override
	public void update(int bnum) {
		
	}
	
	@Override
	public void delete(int bnum) {
		sqlSession.delete("rent.delete", bnum);
	}
	
	@Override
	public int countRent(String userid, String book_id) {
		return 0;
	}
	
	@Override
	public void modifyRent(RentDTO dto) {
		sqlSession.update("rent.modifyRent", dto);
	}
	
	@Override
	public void extend(int bnum) {
		sqlSession.update("rent.extend", bnum);
	}
	
	@Override
	public void show(int bnum) {
		sqlSession.update("rent.show", bnum);
	}
}
