package com.pina.jisutay.room.service;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
		List<RoomDto> list=roomDao.getList();
		
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
		
		// 객실 이미지를 리스트로 변환
		List<String> imgList = Arrays.asList(dto.getImg_path().split(","));
		request.setAttribute("imgList", imgList);
	}
	
	@Override
	public void update(RoomDto dto, MultipartHttpServletRequest mtfReq) {
		List<MultipartFile> fileList = mtfReq.getFiles("file");
		List<String> imgPathList = new ArrayList<String>();
		
		String path = "/resources/Jisutayimage/room/room"+dto.getNum();
		
		String realPath=mtfReq.getServletContext().getRealPath(path);
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
            imgPathList.add(path + "/" + originFileName);
        }       
        String img_path = String.join(",", imgPathList);
        dto.setImg_path(img_path);
        roomDao.update(dto);
	}
}
