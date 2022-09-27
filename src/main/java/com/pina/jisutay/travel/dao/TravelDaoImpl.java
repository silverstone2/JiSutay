package com.pina.jisutay.travel.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pina.jisutay.travel.dto.TravelDto;

@Repository
public class TravelDaoImpl implements TravelDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public void insert(TravelDto dto) {
		session.insert("travel.insert", dto);
	}

	@Override
	public List<TravelDto> getList() {
		
		return session.selectList("travel.getList");
	}

	@Override
	public TravelDto getData(int num) {
		
		return session.selectOne("travel.getData", num);
	}

	@Override
	public void update(TravelDto dto) { 
		session.update("travel.update", dto);
	}

	@Override
	public void delete(int num) {
		session.delete("travel.delete", num);
	}
}
