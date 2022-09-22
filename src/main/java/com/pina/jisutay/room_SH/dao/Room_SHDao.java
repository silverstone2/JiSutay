package com.pina.jisutay.room_SH.dao;

import java.util.List;

import com.pina.jisutay.room_SH.dto.Room_SHDto;

public interface Room_SHDao {
	public List<Room_SHDto> getList();
	public void insert(Room_SHDto dto);
	public Room_SHDto getData(int num);
	public void update(Room_SHDto dto);
	public void delete(int num);
}
