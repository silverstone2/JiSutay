package com.pina.jisutay.room.service;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.pina.jisutay.comments.dao.CommentsDao;
import com.pina.jisutay.comments.dto.CommentsDto;
import com.pina.jisutay.room.dao.RoomDao;
import com.pina.jisutay.room.dto.RoomDto;

@Service
public class RoomServiceImpl implements RoomService {

	@Autowired
	private RoomDao roomDao;
	@Autowired
	private CommentsDao commentsDao;
	
	@Override
	public void getList(HttpServletRequest request) {
		
		RoomDto dto=new RoomDto();
		List<RoomDto> list=roomDao.getList(dto);
		
		//view page 에서 필요한 값을 request 에 담아준다. 
		request.setAttribute("list", list);
	}
	
	@Override
	public void getDetail(HttpServletRequest request) {
		int num=Integer.parseInt(request.getParameter("num"));
		
		RoomDto dto=new RoomDto();
		dto.setNum(num);
		dto=roomDao.getData(dto);
		
		request.setAttribute("dto", dto);
		
	}
}
