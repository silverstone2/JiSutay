package com.pina.jisutay.reservation.dao;

import java.util.List;
import java.util.Map;

import com.pina.jisutay.reservation.dto.ReservationDto;
import com.pina.jisutay.room.dto.RoomDto;

public interface ReservationDao {
	public void insert(ReservationDto dto);
	public void update(ReservationDto dto);
	public void delete(int num);
	public ReservationDto getData(int num);  //기존 
	public List<ReservationDto> getList();
	public List<Map<String, Object>> getCheckDate();
	// 마이페이지서 예약정보 가져오기
	public List<ReservationDto> getResList(ReservationDto dto);
	// 마이페이지서 예약정보 삭제하기
	public void resDelete(int num);
	
	
}
