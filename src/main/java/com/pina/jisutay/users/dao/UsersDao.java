package com.pina.jisutay.users.dao;

import com.pina.jisutay.users.dto.UsersDto;

public interface UsersDao {
	public UsersDto checkId(String id);
	public void insert(UsersDto dto);
	public void insertSessionId(UsersDto dto);
	public void deleteSessionId(String id);
	public UsersDto selectSessionIdExist(String decodedSessionId);
}
