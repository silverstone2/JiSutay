package com.pina.jisutay.room.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.pina.jisutay.room.dto.RoomDto;

public interface RoomService {
	public void getList(HttpServletRequest request);
	public void getDetail(HttpServletRequest request);
	public void update(RoomDto dto, MultipartHttpServletRequest mtfReq);
}
