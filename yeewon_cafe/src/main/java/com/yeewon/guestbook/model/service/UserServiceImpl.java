package com.yeewon.guestbook.model.service;

//import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yeewon.guestbook.model.MemberDto;
import com.yeewon.guestbook.model.mapper.UserDao;
//import com.yeewon.util.PageNavigation;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public MemberDto login(Map<String, String> map) throws Exception {
		if(map.get("userid") == null || map.get("userpwd") == null)
			return null;
		return sqlSession.getMapper(UserDao.class).login(map);
	}
	
	@Override
	public List<MemberDto> userList() {
		return sqlSession.getMapper(UserDao.class).userList();
	}

	@Override
	public MemberDto userInfo(String userid) {
		return sqlSession.getMapper(UserDao.class).userInfo(userid);
	}

	@Override
	public void userRegister(MemberDto memberDto) {
		sqlSession.getMapper(UserDao.class).userRegister(memberDto);
	}

	@Override
	public void userModify(MemberDto memberDto) {
		sqlSession.getMapper(UserDao.class).userModify(memberDto);
	}

	@Override
	public void userDelete(String userid) {
		sqlSession.getMapper(UserDao.class).userDelete(userid);
	}
	
	/*
	 * @Override public List<MemberDto> listMember(Map<String, String> map) throws
	 * Exception { Map<String, Object> param = new HashMap<String, Object>();
	 * param.put("key", map.get("key") == null ? "" : map.get("key"));
	 * param.put("word", map.get("word") == null ? "" : map.get("word"));
	 * 
	 * int currentPage = Integer.parseInt(map.get("pg")); int sizePerPage =
	 * Integer.parseInt(map.get("spp")); int start = (currentPage - 1) *
	 * sizePerPage; param.put("start", start); param.put("spp", sizePerPage);
	 * 
	 * return sqlSession.getMapper(UserDao.class).listMember(param); }
	 * 
	 * @Override public PageNavigation makePageNavigation(Map<String, String> map)
	 * throws Exception { int naviSize = 10; int currentPage =
	 * Integer.parseInt(map.get("pg")); int sizePerPage =
	 * Integer.parseInt(map.get("spp")); PageNavigation pageNavigation = new
	 * PageNavigation(); pageNavigation.setCurrentPage(currentPage);
	 * pageNavigation.setNaviSize(naviSize);
	 * 
	 * int totalCount = sqlSession.getMapper(UserDao.class).getTotalCount(map);
	 * pageNavigation.setTotalCount(totalCount);
	 * 
	 * int totalPageCount = (totalCount - 1) / sizePerPage + 1;
	 * pageNavigation.setTotalPageCount(totalPageCount);
	 * 
	 * boolean startRange = currentPage <= naviSize;
	 * pageNavigation.setStartRange(startRange);
	 * 
	 * boolean endRange = (totalPageCount - 1) / naviSize * naviSize < currentPage;
	 * pageNavigation.setEndRange(endRange); pageNavigation.makeNavigator(); return
	 * pageNavigation; }
	 */
	
}
