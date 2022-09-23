package com.pina.jisutay.travel.dto;

import org.springframework.web.multipart.MultipartFile;

public class TravelDto {

	private int num;
	private String writer;
	private String title;
	private String distance;
	private String caption;
	private String imgPath;
	private MultipartFile image;
	
	public TravelDto() {}

	public TravelDto(int num, String writer, String title, String distance, String caption, String imgPath,
			MultipartFile image) {
		this.num = num;
		this.writer = writer;
		this.title = title;
		this.distance = distance;
		this.caption = caption;
		this.imgPath = imgPath;
		this.image = image;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDistance() {
		return distance;
	}

	public void setDistance(String distance) {
		this.distance = distance;
	}

	public String getCaption() {
		return caption;
	}

	public void setCaption(String caption) {
		this.caption = caption;
	}

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	public MultipartFile getImage() {
		return image;
	}

	public void setImage(MultipartFile image) {
		this.image = image;
	}
	
}
