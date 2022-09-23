package com.pina.jisutay.room_SH.service;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pina.jisutay.room_SH.dao.Room_SHDao;
import com.pina.jisutay.room_SH.dto.Room_SHDto;

import oracle.net.aso.m;

@Service
public class Room_SHServiceImpl implements Room_SHService {
	
	@Autowired
	private Room_SHDao dao;
	
	@Override
	public void getList(HttpServletRequest req) {
		List<Room_SHDto> list = dao.getList();
		req.setAttribute("list", list);		
	}

	@Override
	public void insert(Room_SHDto dto, HttpServletRequest req) {
		dao.insert(dto);
	}

	@Override
	public void saveImage(Room_SHDto dto, HttpServletRequest req) {
		MultipartFile file=dto.getFile();
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
		dto.setImg_path("/upload/" + saveFileName);
		dao.insert(dto);
	}

	@Override
	public void getData(HttpServletRequest req) {
		int num = Integer.parseInt(req.getParameter("num"));
		Room_SHDto dto=dao.getData(num);
		List<String> imgList = Arrays.asList(dto.getImg_path().split(","));
		// System.out.println("imgList:"+imgList);
		req.setAttribute("dto", dto);
		req.setAttribute("imgList", imgList);
		
	}

	@Override
	public void update(Room_SHDto dto, MultipartHttpServletRequest mtfReq) {
		List<MultipartFile> fileList = mtfReq.getFiles("file");
		List<String> imgPathList = new ArrayList<String>();
		
		String realPath=mtfReq.getServletContext().getRealPath("/upload");
		String filePath=realPath + File.separator;
		File upload=new File(filePath);
		if(!upload.exists()) {
			upload.mkdir();
		}
        for (MultipartFile mf : fileList) {
        	String originFileName = mf.getOriginalFilename();
            String saveFileName =System.currentTimeMillis() + originFileName;
    		try {
    			mf.transferTo(new File(filePath + saveFileName));
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
            imgPathList.add("/upload/" + saveFileName);
        }       
        String img_path = String.join(",", imgPathList);
        System.out.println(img_path);
        dto.setImg_path(img_path);
        dao.update(dto);
	}

	@Override
	public void delete(HttpServletRequest req) {
		int num = Integer.parseInt(req.getParameter("num"));
		dao.delete(num);
	}
}