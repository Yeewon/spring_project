package com.yeewon.bookstore.model.service;

import java.util.List;

import com.yeewon.bookstore.model.MenuDto;

public interface MenuService {
	
	public List<MenuDto> menuList();
	public List<MenuDto> popularList();
	
	public MenuDto menuInfo(String pid);

}
