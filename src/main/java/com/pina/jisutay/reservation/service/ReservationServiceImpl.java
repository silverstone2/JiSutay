package com.pina.jisutay.reservation.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.pina.jisutay.notice.dto.NoticeDto;
import com.pina.jisutay.reservation.dao.ReservationDao;
import com.pina.jisutay.reservation.dto.ReservationDto;
import com.pina.jisutay.users.dao.UsersDao;
import com.pina.jisutay.users.dto.UsersDto;

@Service
public class ReservationServiceImpl implements ReservationService {
	
	@Autowired
	private ReservationDao dao;

	@Override
	public void addReservation(ReservationDto dto) {
		dao.insert(dto);
		
	}

	@Override
	public void updateReservation(ReservationDto dto) {
		dao.update(dto);
	}

	@Override
	public void deleteReservation(int num) {
		dao.delete(num);
	}

	@Override
	public void getReservation(int num, ModelAndView mView) {
		ReservationDto dto = dao.getData(num);
		mView.addObject("dto",dto);
	}

	@Override
	public void getListReservation(ModelAndView mView) {
		List<ReservationDto> list = dao.getList();
		mView.addObject("list",list);
	}

	@Override
	public List<Map<String, Object>> getCheckDate(HttpServletRequest req) {
		String check_in = req.getParameter("check_in");
		String check_out = req.getParameter("check_out");
		
		// ROOM_NUM, CHECK_IN, CHECK_OUT 이 들어있는 Map IN List
		List<Map<String, Object>> list = dao.getCheckDate();
		List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
		
		for(Map<String, Object> map:list) {
			int room_num = Integer.parseInt(String.valueOf(map.get("ROOM_NUM")));
			String startDate = (String)map.get("CHECK_IN");
			String endDate = (String)map.get("CHECK_OUT");
			
			// 1차 확인
			LocalDate inDate = LocalDate.parse(check_in);
			LocalDate outDate = LocalDate.parse(check_out);
		    LocalDate startLocalDate = LocalDate.parse(startDate);
		    LocalDate endLocalDate = LocalDate.parse(endDate);
		    endLocalDate = endLocalDate.plusDays(1);
		    
		    // 사용자가 입력한 check_in, check_out을 DB에 저장된 날짜 사이에 존재하는 날짜라면 true
		    boolean isInExist = !inDate.isBefore(startLocalDate) && inDate.isBefore(endLocalDate);
		    boolean isOutExist = !outDate.isBefore(startLocalDate) && outDate.isBefore(endLocalDate);
		    
		    // 2차 확인
		    endLocalDate = endLocalDate.minusDays(1);
		    outDate = outDate.plusDays(1);
		    boolean isStartExist = !startLocalDate.isBefore(inDate) && startLocalDate.isBefore(outDate);
		    boolean isEndExist = !endLocalDate.isBefore(inDate) && endLocalDate.isBefore(outDate);
		    
		    // 하나라도 true면 예약 불가
		    if(isInExist || isOutExist || isStartExist || isEndExist) {
		    	Map<String, Object> resultMap = new HashMap<String, Object>();
		    	resultMap.put("room_num", room_num);
		    	boolean isExist = resultList.contains(resultMap);
		    	if(!isExist) {
		    		resultList.add(resultMap);
		    	}
		    }
		}
		
		// List의 길이가 0일 때, 인덱스 에러 처리
		if(resultList.toArray().length == 0) {
			Map<String, Object> resultMap = new HashMap<String, Object>();
	    	resultMap.put("isNull", true);
			resultList.add(resultMap);
		}
		
		return resultList;
	}

	/*
	 * public void getResInfo(HttpSession session, ModelAndView mView) { //로그인된 아이디를
	 * 읽어온다. //String id=(String)session.getAttribute("res_id"); //DB 에서 회원 정보를 얻어와서
	 * //ReservationDto resdto = dao.getData2(id); // Rdto를 list에 담아준다.
	 * List<ReservationDto> list = dao.getList(); //ModelAndView 객체에 담아준다.
	 * //mView.addObject("rdto", resdto); mView.addObject("list", list); }
	 */

	@Override
	public void getResList(HttpServletRequest req) {
		
		ReservationDto dto=new ReservationDto();
		List<ReservationDto> list=dao.getResList(dto);
		req.setAttribute("list", list);
	}


	
	@Override 
	public void delete(int num, HttpServletRequest request) {

		dao.resDelete(num);
	}
	
}
