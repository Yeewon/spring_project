package com.yeewon.bookstore.model;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

@ApiModel(value = "회원 정보", description = "아이디, 이름, 비밀번호, 이메일, 주소, 가입일을 가진 domain class")
public class MemberDto {

	@ApiModelProperty(value = "회원 아이디")
	private String userid;
	
	@ApiModelProperty(value = "회원 이름")
	private String username;
	
	@ApiModelProperty(value = "회원 비밀번호")
	private String userpwd;
	
	@ApiModelProperty(value = "회원 이메일")
	private String email;
	
	@ApiModelProperty(value = "회원 주소")
	private String address;
	
	@ApiModelProperty(value = "회원 가입일")
	private String joindate;

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUserpwd() {
		return userpwd;
	}

	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getJoindate() {
		return joindate;
	}

	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}

}
