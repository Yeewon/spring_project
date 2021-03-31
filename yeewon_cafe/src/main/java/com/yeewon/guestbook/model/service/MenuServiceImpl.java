package com.yeewon.guestbook.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yeewon.guestbook.model.MenuDto;
import com.yeewon.guestbook.model.mapper.MenuDao;

@Service
public class MenuServiceImpl implements MenuService{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<MenuDto> menuList(){
		return sqlSession.getMapper(MenuDao.class).menuList();
	}
	
	@Override
	public List<MenuDto> popularList(){
		return sqlSession.getMapper(MenuDao.class).popularList();
	}
	
	@Override
	public MenuDto menuInfo(String pid){
		return sqlSession.getMapper(MenuDao.class).menuInfo(pid);
	}

}
