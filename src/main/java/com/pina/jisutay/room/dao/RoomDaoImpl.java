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
	public List<RoomDto> getList(RoomDto dto) {
		
		return session.selectList("room.getList", dto);
	}

//	@Override
//	public RoomDto getData(int num) {
//		return session.selectOne("room.getData", num);
//	}

	@Override
	public RoomDto getData(RoomDto dto) {
		return session.selectOne("room.getData", dto);
	}

}
