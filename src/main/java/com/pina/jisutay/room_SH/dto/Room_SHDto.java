package com.pina.jisutay.room_SH.dto;

import org.springframework.web.multipart.MultipartFile;

public class Room_SHDto {
	private int num;
	private String room_name;
	private String room_price;
	private String room_structure;
	private String room_size;
	private String room_people;
	private String room_items;
	private String room_introduce;
	private String bedroom_tyep;
	private String img_path;
	private MultipartFile file;
	
	public Room_SHDto() {}

	public Room_SHDto(int num, String room_name, String room_price, String room_structure, String room_size,
			String room_people, String room_items, String room_introduce, String bedroom_tyep, String img_path,
			MultipartFile file) {
		this.num = num;
		this.room_name = room_name;
		this.room_price = room_price;
		this.room_structure = room_structure;
		this.room_size = room_size;
		this.room_people = room_people;
		this.room_items = room_items;
		this.room_introduce = room_introduce;
		this.bedroom_tyep = bedroom_tyep;
		this.img_path = img_path;
		this.file = file;
	}

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

	public String getRoom_price() {
		return room_price;
	}

	public void setRoom_price(String room_price) {
		this.room_price = room_price;
	}

	public String getRoom_structure() {
		return room_structure;
	}

	public void setRoom_structure(String room_structure) {
		this.room_structure = room_structure;
	}

	public String getRoom_size() {
		return room_size;
	}

	public void setRoom_size(String room_size) {
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

	public String getRoom_introduce() {
		return room_introduce;
	}

	public void setRoom_introduce(String room_introduce) {
		this.room_introduce = room_introduce;
	}

	public String getBedroom_tyep() {
		return bedroom_tyep;
	}

	public void setBedroom_tyep(String bedroom_tyep) {
		this.bedroom_tyep = bedroom_tyep;
	}

	public String getImg_path() {
		return img_path;
	}

	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

}
