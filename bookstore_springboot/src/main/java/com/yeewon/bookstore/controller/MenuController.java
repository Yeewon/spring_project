package com.yeewon.bookstore.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.*;
import org.springframework.web.bind.annotation.*;

import com.yeewon.bookstore.model.service.MenuService;
import com.yeewon.bookstore.model.MenuDto;

@RestController
@RequestMapping("/menu")
public class MenuController {
	
	@Autowired
	private MenuService menuService;

	@GetMapping(value = "/list", headers = { "Content-type=application/json" })
	public List<MenuDto> menuList(){
		return menuService.menuList();
	}
	
	@GetMapping(value = "/popularList", headers = { "Content-type=application/json" })
	public List<MenuDto> popularList(){
		return menuService.popularList();
	}
	
	@GetMapping(value = "/list/{pid}", headers = { "Content-type=application/json" })
	public MenuDto menuInfo(@PathVariable("pid") String pid) {
		return menuService.menuInfo(pid); 
	}


}
