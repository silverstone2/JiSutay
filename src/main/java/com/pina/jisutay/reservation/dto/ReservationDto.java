package com.pina.jisutay.reservation.dto;

public class ReservationDto {
	private int num;
	private String res_id;
	private String check_in;
	private String check_out;
	private int res_people;
	private int room_num;
	private String regdate;
	
	public ReservationDto () {}
	
	public ReservationDto(int num, String res_id, String check_in, String check_out, int res_people, int room_num,
			String regdate) {
		super();
		this.num = num;
		this.res_id = res_id;
		this.check_in = check_in;
		this.check_out = check_out;
		this.res_people = res_people;
		this.room_num = room_num;
		this.regdate = regdate;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getRes_id() {
		return res_id;
	}

	public void setRes_id(String res_id) {
		this.res_id = res_id;
	}

	public String getCheck_in() {
		return check_in;
	}

	public void setCheck_in(String check_in) {
		this.check_in = check_in;
	}

	public String getCheck_out() {
		return check_out;
	}

	public void setCheck_out(String check_out) {
		this.check_out = check_out;
	}

	public int getRes_people() {
		return res_people;
	}

	public void setRes_people(int res_people) {
		this.res_people = res_people;
	}

	public int getRoom_num() {
		return room_num;
	}

	public void setRoom_num(int room_num) {
		this.room_num = room_num;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
}
