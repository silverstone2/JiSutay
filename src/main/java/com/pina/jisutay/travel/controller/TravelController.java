package com.pina.jisutay.travel.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.pina.jisutay.travel.dto.TravelDto;
import com.pina.jisutay.travel.service.TravelService;

@Controller
public class TravelController {
	
	@Autowired
	private TravelService service;
	
	@RequestMapping("/travel/list")
	public String getList(HttpServletRequest req) {
		service.getList(req);
		return "travel/list";
	}
	@RequestMapping("/travel/uploadform")
	public String uploadForm(HttpServletRequest req) {
		
		return "travel/uploadform";
	}
	
	@RequestMapping("/travel/upload")
	public String saveImage(TravelDto dto, HttpServletRequest req) {
		service.saveImage(dto, req);
		return "travel/upload";
	}
	
	@RequestMapping("/travel/insert")
	public String Insert(TravelDto dto, HttpServletRequest req) {
		service.insert(dto, req);
		return "travel/upload";
	}
	
	@RequestMapping("/travel/updateform")
	public String updateform(HttpServletRequest req) {
		service.getData(req);
		return "travel/updateform";
	}
	
	@RequestMapping(value = "/travel/update", method = RequestMethod.POST)
	public String update(TravelDto dto, HttpServletRequest req) {
		service.update(dto, req);
		return "travel/update";
	}
	
	@RequestMapping("/travel/delete")
	public String Delete(HttpServletRequest req) {
		
		service.delete(req);
		
		return "travel/delete";
	}
}
