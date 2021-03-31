package com.yeewon.guestbook.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.yeewon.guestbook.model.MemberDto;
import com.yeewon.guestbook.model.MenuDto;
import com.yeewon.guestbook.model.service.MenuService;

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
		return menuService.menuInfo(pid); //pid에 해당하는 MenuDto 얻어온다. 
	}
	
}
