package com.pina.jisutay.travel.service;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.pina.jisutay.travel.dao.TravelDao;
import com.pina.jisutay.travel.dto.TravelDto;

@Service
public class TravelServiceImpl implements TravelService{

	@Autowired
	private TravelDao dao;

	@Override
	public void insert(TravelDto dto, HttpServletRequest request) {
		
		dao.insert(dto);		
	}

	@Override
	public void saveImage(TravelDto dto, HttpServletRequest req) {
		//이미지 관련 설정해주기
		MultipartFile file=dto.getImage();
		String orgFileName=file.getOriginalFilename();
		String realPath=req.getServletContext().getRealPath("/upload");
		String filePath=realPath + File.separator;
		File upload=new File(filePath);
		if(!upload.exists()) {
			upload.mkdir();
		}
		String saveFileName=System.currentTimeMillis() + orgFileName;
		try {
			file.transferTo(new File(filePath + saveFileName));
		}catch(Exception e) {
			e.printStackTrace();
		}
		//이미지경로 dto에 담기
		dto.setImgPath("/upload/" + saveFileName);
		dao.insert(dto);
	}

	@Override
	public void getList(HttpServletRequest req) {
		List<TravelDto> list = dao.getList();
		System.out.println(list.get(0).getImgPath());
		req.setAttribute("list", list);	
	}

	@Override
	public void getData(HttpServletRequest req) {
		int num = Integer.parseInt(req.getParameter("num"));
		TravelDto dto=dao.getData(num);
		req.setAttribute("dto", dto);
	}

	@Override
	public void update(TravelDto dto, HttpServletRequest req) {
		MultipartFile file=dto.getImage();
		String orgFileName=file.getOriginalFilename();
		String realPath=req.getServletContext().getRealPath("/upload");
		String filePath=realPath + File.separator;
		File upload=new File(filePath);
		if(!upload.exists()) {
			upload.mkdir();
		}
		String saveFileName=System.currentTimeMillis() + orgFileName;
		try {
			file.transferTo(new File(filePath + saveFileName));
		}catch(Exception e) {
			e.printStackTrace();
		}
		//이미지경로 dto에 담기
		dto.setImgPath("/upload/" + saveFileName);
		System.out.println(dto.getImgPath());
		dao.update(dto);
	}
}
