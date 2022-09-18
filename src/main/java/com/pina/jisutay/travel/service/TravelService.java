package com.pina.jisutay.travel.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.pina.jisutay.travel.dto.TravelDto;

public interface TravelService {
	
	public void getList(HttpServletRequest req);
	public void insert(TravelDto dto, HttpServletRequest req);
	public void saveImage(TravelDto dto, HttpServletRequest req);
	public void getData(HttpServletRequest req);
	public void update(TravelDto dto, HttpServletRequest req);
	public void delete(HttpServletRequest req);
}
