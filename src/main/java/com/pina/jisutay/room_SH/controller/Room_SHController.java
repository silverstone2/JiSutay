package com.pina.jisutay.room_SH.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pina.jisutay.room_SH.dto.Room_SHDto;
import com.pina.jisutay.room_SH.service.Room_SHService;

@Controller
public class Room_SHController {
	
	@Autowired
	Room_SHService service;
	
	@RequestMapping("/room_SH/list")
	public String list(HttpServletRequest req, int num) {
		req.setAttribute("num", num);
		service.getData(req);
		return "room_SH/list";
	}
	
	@RequestMapping("/room_SH/uploadform")
	public String uploadForm(HttpServletRequest req) {
		
		return "room_SH/uploadform";
	}
	
	@RequestMapping("/room_SH/upload")
	public String saveImage(Room_SHDto dto, HttpServletRequest req) {
		service.saveImage(dto, req);
		return "room_SH/upload";
	}
	
	@RequestMapping("/room_SH/insert")
	public String Insert(Room_SHDto dto, HttpServletRequest req) {
		service.insert(dto, req);
		return "room_SH/upload";
	}
	
	@RequestMapping("/room_SH/updateform")
	public String updateform(HttpServletRequest req) {
		service.getData(req);
		return "room_SH/updateform";
	}
	
	@RequestMapping(value = "/room_SH/update", method = RequestMethod.POST)
	public String update(Room_SHDto dto, MultipartHttpServletRequest mtfReq) {
		service.update(dto, mtfReq);
		System.out.println("완료됨");
		return "room_SH/update";
	}
	
	@RequestMapping("/room_SH/delete")
	public String Delete(HttpServletRequest req) {
		
		service.delete(req);
		
		return "Room_SH/delete";
	}
}
