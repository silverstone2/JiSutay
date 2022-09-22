package com.pina.jisutay.room_SH.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pina.jisutay.room_SH.dto.Room_SHDto;

@Repository
public class Room_SHDaoImpl implements Room_SHDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public List<Room_SHDto> getList() {
		
		return session.selectList("room_SH.getList");
	}

	@Override
	public void insert(Room_SHDto dto) {
		session.insert("room_SH.insert", dto);
	}

	@Override
	public Room_SHDto getData(int num) {
		
		return session.selectOne("room_SH.getData", num);
	}

	@Override
	public void update(Room_SHDto dto) {
		System.out.println("dao : "+dto.getNum());
		session.update("room_SH.update", dto);
		System.out.println("sql 실행 완료");
	}

	@Override
	public void delete(int num) {
		
		session.delete("room_SH.delete", num);
	}

}
