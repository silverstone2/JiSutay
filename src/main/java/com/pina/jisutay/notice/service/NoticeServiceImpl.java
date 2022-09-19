package com.pina.jisutay.notice.service;



import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.pina.jisutay.exception.NotAccessInsert;
import com.pina.jisutay.notice.dao.NoticeDao;
import com.pina.jisutay.notice.dto.NoticeDto;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeDao noticeDao;
	
	@Override
	public void getList(HttpServletRequest req) {
		
		final int PAGE_ROW_COUNT = 5;
		final int PAGE_DISPLAY_COUNT = 5;
		
		int pageNum=1;
		
		String strPageNum=req.getParameter("pageNum");
		//만일 페이지 번호가 파라미터로 넘어 온다면
		if(strPageNum != null){
			//숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
			pageNum=Integer.parseInt(strPageNum);
		}
		
		//보여줄 페이지의 시작 ROWNUM
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		//보여줄 페이지의 끝 ROWNUM
		int endRowNum=pageNum*PAGE_ROW_COUNT;

		String keyword=req.getParameter("keyword");
		String condition=req.getParameter("condition");
		//만일 키워드가 넘어오지 않는다면 
		if(keyword==null){
			//키워드와 검색 조건에 빈 문자열을 넣어준다. 
			//클라이언트 웹브라우저에 출력할때 "null" 을 출력되지 않게 하기 위해서  
			keyword="";
			condition=""; 
		}

		//특수기호를 인코딩한 키워드를 미리 준비한다. 
		String encodedK=URLEncoder.encode(keyword);
		
		//CafeDto 객체에 startRowNum 과 endRowNum 을 담는다.
		NoticeDto ndto=new NoticeDto();
		ndto.setStartRowNum(startRowNum);
		ndto.setEndRowNum(endRowNum);

		//만일 검색 키워드가 넘어온다면 
		if(!keyword.equals("")){
			//검색 조건이 무엇이냐에 따라 분기 하기
			if(condition.equals("title_content")){//제목 + 내용 검색인 경우
				//검색 키워드를 CafeDto 에 담아서 전달한다.
				ndto.setTitle(keyword);
				ndto.setContent(keyword);
			}else if(condition.equals("title")){ //제목 검색인 경우
				ndto.setTitle(keyword);
			}else if(condition.equals("writer")){ //작성자 검색인 경우
				ndto.setWriter(keyword);
			} // 다른 검색 조건을 추가 하고 싶다면 아래에 else if() 를 계속 추가 하면 된다.
		}
		//글 목록 얻어오기 
		List<NoticeDto> list=noticeDao.getList(ndto);
		//전체글의 갯수
		int totalRow=noticeDao.getCount(ndto);
		
		//하단 시작 페이지 번호 
		int startPageNum = 1 + ((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		//하단 끝 페이지 번호
		int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
		

		//전체 페이지의 갯수
		int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		//끝 페이지 번호가 전체 페이지 갯수보다 크다면 잘못된 값이다.
		if(endPageNum > totalPageCount){
			endPageNum=totalPageCount; //보정해 준다.
		}
		//view page 에서 필요한 값을 request 에 담아준다. 
		req.setAttribute("pageNum", pageNum);
		req.setAttribute("startPageNum", startPageNum);
		req.setAttribute("endPageNum", endPageNum);
		req.setAttribute("condition", condition);
		req.setAttribute("keyword", keyword);
		req.setAttribute("encodedK", encodedK);
		req.setAttribute("totalPageCount", totalPageCount);
		req.setAttribute("list", list);
		req.setAttribute("totalRow", totalRow);
	}
	
	@Override
	public void detail(ModelAndView mav, int num) {
		noticeDao.addViewCount(num);
		NoticeDto dto = noticeDao.getData(num);
		
		System.out.println(dto.getNum());
		System.out.println(dto.getWriter());
		System.out.println(dto.getTitle());
		System.out.println(dto.getContent());
		
		mav.addObject("dto", dto);
	}

	@Override
	public void insert(NoticeDto ndto, HttpServletRequest req) {
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("id");
		ndto.setWriter(id);
		
		if(!id.equals("admin")) {
			throw new NotAccessInsert("관리자만 접근 가능합니다!");
		}
		
		noticeDao.insert(ndto);
		
	}

	@Override
	public void update(NoticeDto ndto, HttpServletRequest req) {
		
		noticeDao.update(ndto);
	}

	/*
	 * @Override public void getData(ModelAndView mav, int num) { //NoticeDto
	 * ndto=noticeDao.getData(mav, num); mav.addObject("num", num);
	 * //mav.addObject("ndto", ndto); }
	 */
	@Override
	public void getData(HttpServletRequest request) {
		//수정할 글번호
		int num=Integer.parseInt(request.getParameter("num"));
		//수정할 글의 정보 얻어와서 
		NoticeDto dto=noticeDao.getData(num);
		//request 에 담아준다.
		request.setAttribute("dto", dto);
	}

	@Override
	public void delete(int num, HttpServletRequest request) {
		
		noticeDao.delete(num);
	}
	
}
