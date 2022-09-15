package com.pina.jisutay.room.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.pina.jisutay.room.dao.RoomDao;
import com.pina.jisutay.room.dto.RoomDto;

@Service
public class RoomServiceImpl implements RoomService {
	
	@Autowired
	private RoomDao dao;

	@Override
	public void getListMember(ModelAndView mView) {
		List<RoomDto> list = dao.getList();
		mView.addObject("list" , list);
		
	}

}
