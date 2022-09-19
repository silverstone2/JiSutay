package com.pina.jisutay.room_SH.service;

import javax.servlet.http.HttpServletRequest;

import com.pina.jisutay.room_SH.dto.Room_SHDto;

public interface Room_SHService {
	public void getList(HttpServletRequest req);
	public void insert(Room_SHDto dto, HttpServletRequest req);
	public void saveImage(Room_SHDto dto, HttpServletRequest req);
	public void getData(HttpServletRequest req);
	public void update(Room_SHDto dto, HttpServletRequest req);
	public void delete(HttpServletRequest req);
}
