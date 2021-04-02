package com.yeewon.bookstore.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yeewon.bookstore.model.MenuDto;
import com.yeewon.bookstore.model.mapper.MenuMapper;

@Service
public class MenuServiceImpl implements MenuService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<MenuDto> menuList(){
		return sqlSession.getMapper(MenuMapper.class).menuList();
	}
	
	@Override
	public List<MenuDto> popularList(){
		return sqlSession.getMapper(MenuMapper.class).popularList();
	}
	
	@Override
	public MenuDto menuInfo(String pid){
		return sqlSession.getMapper(MenuMapper.class).menuInfo(pid);
	}

}
