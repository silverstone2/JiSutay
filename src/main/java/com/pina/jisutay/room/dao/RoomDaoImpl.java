package com.pina.jisutay.room.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pina.jisutay.room.dto.RoomDto;

@Repository
public class RoomDaoImpl implements RoomDao{
	@Autowired
	private SqlSession session;

	@Override
	public List<RoomDto> getList() {
		return session.selectList("room.getList");
	}

	@Override
	public RoomDto getData(RoomDto dto) {
		return session.selectOne("room.getData", dto);
	}
	
	@Override
	public void update(RoomDto dto) {
		session.update("room.update", dto);
	}
}
