package com.pina.jisutay.comments.dto;

public class CommentsDto {
	private int num;
	private String writer;
	private String room_img;
	private int score;
	private String regdate;
	private String content;
	private String target_id;
	private int room_num;
	private int comment_num;
	private String deleted;
	private int startRowNum;
	private int endRowNum;
	
	public CommentsDto() {}
	
	public CommentsDto(int num, String writer, String room_img, int score, String regdate, String content,
			String target_id, int room_num, int comment_num, String deleted, int startRowNum, int endRowNum) {
		super();
		this.num = num;
		this.writer = writer;
		this.room_img = room_img;
		this.score = score;
		this.regdate = regdate;
		this.content = content;
		this.target_id = target_id;
		this.room_num = room_num;
		this.comment_num = comment_num;
		this.deleted = deleted;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getRoom_img() {
		return room_img;
	}
	public void setRoom_img(String room_img) {
		this.room_img = room_img;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTarget_id() {
		return target_id;
	}
	public void setTarget_id(String target_id) {
		this.target_id = target_id;
	}
	public int getRoom_num() {
		return room_num;
	}
	public void setRoom_num(int room_num) {
		this.room_num = room_num;
	}
	public int getComment_num() {
		return comment_num;
	}
	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}
	public String getDeleted() {
		return deleted;
	}
	public void setDeleted(String deleted) {
		this.deleted = deleted;
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
}
