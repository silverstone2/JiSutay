package com.pina.jisutay.reservation.service;

import org.springframework.web.servlet.ModelAndView;

import com.pina.jisutay.reservation.dto.ReservationDto;

public interface ReservationService {
	
	public void addReservation(ReservationDto dto);
	public void updateReservation(ReservationDto dto);
	public void deleteReservation(int num);
	public void getReservation(int num, ModelAndView mView);
	public void getListReservation(ModelAndView mView);

}
