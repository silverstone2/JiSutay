package com.pina.jisutay.reservation.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.pina.jisutay.reservation.dto.ReservationDto;

public interface ReservationService {
	
	public void addReservation(ReservationDto dto);
	public void updateReservation(ReservationDto dto);
	public void deleteReservation(int num);
	public void getReservation(int num, ModelAndView mView);
	public void getListReservation(ModelAndView mView);
	public List<Map<String, Object>> getCheckDate(HttpServletRequest req);

	// 회원 예약 정보 확인 Controller는 UsersController에 
	public void getResList(HttpServletRequest req);
	// 예약정보 삭제
	public void delete(int num, HttpServletRequest request);

	// 예약 정보 확인
	public void getResInfo(HttpSession session, ModelAndView mView);

}
