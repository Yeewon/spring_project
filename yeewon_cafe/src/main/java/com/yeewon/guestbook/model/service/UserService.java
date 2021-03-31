package com.yeewon.guestbook.model.service;

import java.util.List;
import java.util.Map;

import com.yeewon.guestbook.model.MemberDto;
//import com.yeewon.util.PageNavigation;

public interface UserService {

	public MemberDto login(Map<String, String> map) throws Exception;
	
	public List<MemberDto> userList();
	public MemberDto userInfo(String userid);
	public void userRegister(MemberDto memberDto);
	public void userModify(MemberDto memberDto);
	public void userDelete(String userid);
	/*
	 * public List<MemberDto> listMember(Map<String, String> map) throws Exception;
	 * public PageNavigation makePageNavigation(Map<String, String> map) throws
	 * Exception;
	 */
}
