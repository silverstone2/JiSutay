package com.pina.jisutay.users.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pina.jisutay.reservation.dto.ReservationDto;
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
	
	// 마이페이지 추가
	public UsersDto getData(String id) {
		// 존재하지 않은 아이디면 null 이 리턴된다. 
		return session.selectOne("users.getData", id); // 아이디 1개 select
	}
	// 패스워드 수정
	@Override
	public void updatePwd(UsersDto dto) {
		session.update("users.pwdUpdate", dto);
	}

	// 마이페이지 수정
	@Override
	public void update(UsersDto dto) {
		session.update("users.update", dto);
	}
	
	// 개인정보 삭제
	@Override
	public void delete(String id) {
		
		session.delete("users.delete", id);
	}
}
