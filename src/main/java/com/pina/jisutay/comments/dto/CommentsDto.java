package com.pina.jisutay.comments.dto;

public class CommentsDto {
	// comments 테이블 칼럼
	private int num;			// 글번호
	private String writer;		// 작성자
	private String room_img;	// 사진
	private double score;		// 별점(1~5)
	private String regdate;		// 날짜(작성일)
	private String content;		// 내용
	private String target_id;	// 
	private int room_num;		// 방번호
	private int comment_num;	// 댓글번호
	private String deleted;		// 삭제
	private int startRowNum;	// 
	private int endRowNum;		// 
	private int commCount;		// 
	
	// users 테이블 칼럼
	private String name;		// 사용자
	private String profile;		// 정보

	// 정렬 키워드 변수
	private String sort;
	
	
	public CommentsDto() {}

	public CommentsDto(int num, String writer, String room_img, double score, String regdate, String content,
			String target_id, int room_num, int comment_num, String deleted, int startRowNum, int endRowNum,
			int commCount, String name, String profile, String sort) {
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
		this.commCount = commCount;
		this.name = name;
		this.profile = profile;
		this.sort = sort;
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
	public double getScore() {
		return score;
	}
	public void setScore(double score) {
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public int getCommCount() {
		return commCount;
	}

	public void setCommCount(int commCount) {
		this.commCount = commCount;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}
}
