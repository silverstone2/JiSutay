package com.pina.jisutay.reservation.dao;

import java.util.List;
import java.util.Map;

import com.pina.jisutay.reservation.dto.ReservationDto;
import com.pina.jisutay.room.dto.RoomDto;

public interface ReservationDao {
	public void insert(ReservationDto dto);
	public void update(ReservationDto dto);
	public void delete(int num);
	public ReservationDto getData(int num);
	public List<ReservationDto> getList();
	public List<Map<String, Object>> getCheckDate();
}
