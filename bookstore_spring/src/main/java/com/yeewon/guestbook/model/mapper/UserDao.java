package com.yeewon.guestbook.model.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.yeewon.guestbook.model.MemberDto;

public interface UserDao {

	public MemberDto login(Map<String, String> map) throws SQLException;
	
	public List<MemberDto> userList();
	public MemberDto userInfo(String userid);
	public void userRegister(MemberDto memberDto);
	public void userModify(MemberDto memberDto);
	public void userDelete(String userid);
	

//	public List<MemberDto> listMember(Map<String, Object> map) throws SQLException;
//	public int getTotalCount(Map<String, String> map) throws SQLException;
	
	
}
