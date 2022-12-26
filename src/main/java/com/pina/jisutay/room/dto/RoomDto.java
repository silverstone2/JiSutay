package com.pina.jisutay.room.dto;

public class RoomDto {
	private int num;
	private String room_name;		// 방이름
	private int room_price;			// 방가격
	private String room_structure;	// 방구조
	private int room_size;			// 방사이즈
	private String room_people;		// 방인원
	private String room_items;		// 방
	private String bedroom_type;	// 방 타입
	private String room_introduce;	// 방 설명
	private String img_path;		// 사진

	
	public RoomDto(int num, String room_name, int room_price, String room_structure, int room_size, String room_people,
			String room_items, String bedroom_type, String room_introduce, String img_path) {
		super();
		this.num = num;
		this.room_name = room_name;
		this.room_price = room_price;
		this.room_structure = room_structure;
		this.room_size = room_size;
		this.room_people = room_people;
		this.room_items = room_items;
		this.bedroom_type = bedroom_type;
		this.room_introduce = room_introduce;
		this.img_path = img_path;
	}

	public RoomDto() {}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getRoom_name() {
		return room_name;
	}

	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}

	public int getRoom_price() {
		return room_price;
	}

	public void setRoom_price(int room_price) {
		this.room_price = room_price;
	}

	public String getRoom_structure() {
		return room_structure;
	}

	public void setRoom_structure(String room_structure) {
		this.room_structure = room_structure;
	}

	public int getRoom_size() {
		return room_size;
	}

	public void setRoom_size(int room_size) {
		this.room_size = room_size;
	}

	public String getRoom_people() {
		return room_people;
	}

	public void setRoom_people(String room_people) {
		this.room_people = room_people;
	}

	public String getRoom_items() {
		return room_items;
	}

	public void setRoom_items(String room_items) {
		this.room_items = room_items;
	}

	public String getBedroom_type() {
		return bedroom_type;
	}

	public void setBedroom_type(String bedroom_type) {
		this.bedroom_type = bedroom_type;
	}

	public String getRoom_introduce() {
		return room_introduce;
	}

	public void setRoom_introduce(String room_introduce) {
		this.room_introduce = room_introduce;
	}
	
	public String getImg_path() {
		return img_path;
	}

	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}
}

