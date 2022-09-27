package com.pina.jisutay.users.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pina.jisutay.users.dto.UsersDto;

@Repository
public class UsersDaoImpl implements UsersDao {
	@Autowired
	private SqlSession session;
	
	@Override
	public void insert(UsersDto dto) {
		session.insert("users.insert", dto);
	}

	@Override
	public UsersDto checkId(String id) {
		UsersDto dto = session.selectOne("users.selectId", id);
		return dto;
	}

	@Override
	public void insertSessionId(UsersDto dto) {
		session.update("users.insertSessionId", dto);
	}

	@Override
	public void deleteSessionId(String id) {
		session.update("users.deleteSessionId", id);
	}

	@Override
	public UsersDto selectSessionIdExist(String decodedSessionId) {
		UsersDto dto = session.selectOne("users.selectSessionIdExist", decodedSessionId);
		return dto;
	}

}
