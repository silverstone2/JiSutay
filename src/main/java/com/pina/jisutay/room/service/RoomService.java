package com.pina.jisutay.room.service;

import javax.servlet.http.HttpServletRequest;

public interface RoomService {
	public void getList(HttpServletRequest request);
	public void getDetail(HttpServletRequest request);
}
