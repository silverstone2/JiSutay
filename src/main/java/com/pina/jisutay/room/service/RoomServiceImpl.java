package com.pina.jisutay.room.service;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.pina.jisutay.room.dao.RoomDao;
import com.pina.jisutay.room.dto.RoomDto;

@Service
public class RoomServiceImpl implements RoomService {

	@Autowired
	private RoomDao roomDao;
	
	@Override
	public void getList(HttpServletRequest request) {
		
		RoomDto dto=new RoomDto();
		List<RoomDto> list=roomDao.getList(dto);
		
		//view page 에서 필요한 값을 request 에 담아준다. 
		request.setAttribute("list", list);
	}
	
	@Override
	public void getDetail(int num, ModelAndView mav) {
		RoomDto dto = roomDao.getData(num);
		System.out.println(dto.getNum());
		System.out.println(dto.getRoom_introduce());
		
		mav.addObject("dto", dto);
	}
}