package com.pina.jisutay.notice.dto;

public class NoticeDto {
	private int num;
	private String title;
	private String writer;
	private String regdate;
	private int views;
	private String content;
	
	public NoticeDto() {}
	
	public NoticeDto(int num, String title, String writer, String regdate, int views, String content) {
		super();
		this.num = num;
		this.title = title;
		this.writer = writer;
		this.regdate = regdate;
		this.views = views;
		this.content = content;
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
}
