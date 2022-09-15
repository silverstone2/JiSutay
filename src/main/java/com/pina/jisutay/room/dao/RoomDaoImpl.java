package com.pina.jisutay.room.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pina.jisutay.room.dto.RoomDto;

@Repository
public class RoomDaoImpl implements RoomDao {
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<RoomDto> getList() {
		
		List<RoomDto> list = session.selectList("room.getList");
		
		return list;
	}

}
