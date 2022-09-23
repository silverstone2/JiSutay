package com.pina.jisutay.room.dao;

import java.util.List;
import com.pina.jisutay.room.dto.RoomDto;

public interface RoomDao {
	public List<RoomDto> getList();
//	public RoomDto getData(int num);
	public RoomDto getData(RoomDto dto);
}
