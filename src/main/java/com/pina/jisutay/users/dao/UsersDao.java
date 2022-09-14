package com.pina.jisutay.users.dao;

import com.pina.jisutay.users.dto.UsersDto;

public interface UsersDao {
	public UsersDto checkId(String id);
	public void insert(UsersDto dto);
}
