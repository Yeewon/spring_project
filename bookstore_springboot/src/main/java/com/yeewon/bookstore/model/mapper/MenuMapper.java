package com.yeewon.bookstore.model.mapper;

import java.util.List;
import com.yeewon.bookstore.model.MenuDto;

public interface MenuMapper {
	
	public List<MenuDto> menuList();
	public List<MenuDto> popularList();
	
	public MenuDto menuInfo(String pid);
}
