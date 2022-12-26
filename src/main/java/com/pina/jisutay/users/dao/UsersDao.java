package com.pina.jisutay.users.dao;

import com.pina.jisutay.reservation.dto.ReservationDto;
import com.pina.jisutay.users.dto.UsersDto;

public interface UsersDao {
	public UsersDto checkId(String id);
	public void insert(UsersDto dto);
	public void insertSessionId(UsersDto dto);
	public void deleteSessionId(String id);
	public UsersDto selectSessionIdExist(String decodedSessionId);
	//---------------------------------------------
	// 마이페이지에 기존 정보 가져오기.
	
	//인자로 전달하는 아이디에 해당하는 정보를 리턴하는 메소드
	public UsersDto getData(String id);
	// 마이페이지 변경
	public void update(UsersDto dto);
	// 비밀번호 수정 
	public void updatePwd(UsersDto dto);
	// 개인정보 삭제
	public void delete(String id);
	//예약정보 가져오기
	//public ReservationDto getData2(String id); 

}
