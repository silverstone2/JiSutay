package com.pina.jisutay.users.dto;

public class UsersDto {
	private String id;
	private String email;
	private String password;
	private String name;
	private String profile;
	private String regdate;
	
	public UsersDto() {}
	
	public UsersDto(String id, String email, String password, String name, String profile, String regdate) {
		super();
		this.id = id;
		this.email = email;
		this.password = password;
		this.name = name;
		this.profile = profile;
		this.regdate = regdate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
}
