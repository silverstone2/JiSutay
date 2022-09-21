package com.pina.jisutay.notice.service;



import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.pina.jisutay.notice.dao.NoticeDao;
import com.pina.jisutay.notice.dto.NoticeDto;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeDao noticeDao;
	
	@Override
	public void getList(ModelAndView mav) {
		
		List<NoticeDto> list=noticeDao.getList();
		/*
		 * System.out.println(list);
		 * System.out.println(list.get(0).getNum());         오류날 때 출력해봄
		 * System.out.println(list.get(0).getTitle());
		 */
		mav.addObject("list", list);
	}
	
	@Override
	public void detail(ModelAndView mav, int num) {
		NoticeDto dto = noticeDao.getData(num);
		mav.addObject("dto", dto);
	}
}
