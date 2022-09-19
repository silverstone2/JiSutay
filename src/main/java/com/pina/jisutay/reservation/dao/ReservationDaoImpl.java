package com.pina.jisutay.reservation.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pina.jisutay.reservation.dto.ReservationDto;

@Repository
public class ReservationDaoImpl implements ReservationDao{
	
	@Autowired
	private SqlSession session;

	@Override
	public void insert(ReservationDto dto) {
		
		session.insert("reservation.insert", dto);
		
	}

	@Override
	public void update(ReservationDto dto) {
		session.update("reservation.update" , dto);
		
	}

	@Override
	public void delete(int num) {
		session.delete("reservation.delete" , num);
		
	}

	@Override
	public ReservationDto getData(int num) {
		ReservationDto dto = session.selectOne("reservation.getData" , num);
		
		return dto;
	}

	@Override
	public List<ReservationDto> getList() {
		List<ReservationDto> list = session.selectList("reservation.getList");
		
		return list;
	}
	
	
}



