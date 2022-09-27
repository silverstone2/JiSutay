package com.pina.jisutay.notice.dto;

public class NoticeDto {
	private int num; //번호
	private String title; //제목
	private String writer; //작성자
	private String regdate; //작성일자
	private int views; //조회수
	private String content; //글 내용
	private int startRowNum; //시작  페이지
	private int endRowNum; //끝 페이지
	private int prevNum;  //이전 페이지
	private int nextNum; //다음 페이지
	private String prevTitle;//이전 페이지 제목
	private String nextTitle;//다음 페이지 제목
	private String prevDate;// 이전 페이지 날짜
	private String nextDate;// 다음 페이지 날짜
	
	public NoticeDto() {}

	public NoticeDto(int num, String title, String writer, String regdate, int views, String content, int startRowNum,
			int endRowNum, int prevNum, int nextNum, String prevTitle, String nextTitle, String prevDate,
			String nextDate) {
		super();
		this.num = num;
		this.title = title;
		this.writer = writer;
		this.regdate = regdate;
		this.views = views;
		this.content = content;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
		this.prevNum = prevNum;
		this.nextNum = nextNum;
		this.prevTitle = prevTitle;
		this.nextTitle = nextTitle;
		this.prevDate = prevDate;
		this.nextDate = nextDate;
	}



	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	public int getStartRowNum() {
		return startRowNum;
	}

	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}

	public int getEndRowNum() {
		return endRowNum;
	}

	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}

	public int getPrevNum() {
		return prevNum;
	}

	public void setPrevNum(int prevNum) {
		this.prevNum = prevNum;
	}

	public int getNextNum() {
		return nextNum;
	}

	public void setNextNum(int nextNum) {
		this.nextNum = nextNum;
	}

	public String getPrevTitle() {
		return prevTitle;
	}

	public void setPrevTitle(String prevTitle) {
		this.prevTitle = prevTitle;
	}

	public String getNextTitle() {
		return nextTitle;
	}

	public void setNextTitle(String nextTitle) {
		this.nextTitle = nextTitle;
	}

	public String getPrevDate() {
		return prevDate;
	}

	public void setPrevDate(String prevDate) {
		this.prevDate = prevDate;
	}

	public String getNextDate() {
		return nextDate;
	}

	public void setNextDate(String nextDate) {
		this.nextDate = nextDate;
	}
	
}
