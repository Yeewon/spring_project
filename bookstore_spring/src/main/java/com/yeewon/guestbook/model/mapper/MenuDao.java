package com.yeewon.guestbook.model.mapper;

import java.util.List;

import com.yeewon.guestbook.model.MenuDto;

public interface MenuDao {
	
	public List<MenuDto> menuList();
	public List<MenuDto> popularList();
	
	public MenuDto menuInfo(String pid);
}
