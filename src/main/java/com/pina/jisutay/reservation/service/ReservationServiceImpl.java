package com.pina.jisutay.reservation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.pina.jisutay.reservation.dao.ReservationDao;
import com.pina.jisutay.reservation.dto.ReservationDto;

@Service
public class ReservationServiceImpl implements ReservationService {
	
	@Autowired
	private ReservationDao dao;

	@Override
	public void addReservation(ReservationDto dto) {
		dao.insert(dto);
		
	}

	@Override
	public void updateReservation(ReservationDto dto) {
		dao.update(dto);
	}

	@Override
	public void deleteReservation(int num) {
		dao.delete(num);
	}

	@Override
	public void getReservation(int num, ModelAndView mView) {
		ReservationDto dto = dao.getData(num);
		mView.addObject("dto",dto);
	}

	@Override
	public void getListReservation(ModelAndView mView) {
		List<ReservationDto> list = dao.getList();
		mView.addObject("list",list);
	}
}
