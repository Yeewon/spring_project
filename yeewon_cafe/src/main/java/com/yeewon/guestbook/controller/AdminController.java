package com.yeewon.guestbook.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.yeewon.guestbook.model.MemberDto;
import com.yeewon.guestbook.model.service.UserService;

@RestController
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private UserService userService;
	
	@GetMapping(value = "/user", headers = { "Content-type=application/json" })
	public List<MemberDto> userList() {
		return userService.userList();
	}
	
	@PostMapping(value = "/user", headers = { "Content-type=application/json" })
	public List<MemberDto> userRegister(@RequestBody MemberDto memberDto) {
		userService.userRegister(memberDto);
		return userService.userList();
	}
	
	@GetMapping(value = "/user/{userid}", headers = { "Content-type=application/json" })
	public MemberDto userInfo(@PathVariable("userid") String userid) {
		return userService.userInfo(userid); //id에 해당하는 MemberDto 얻어온다. 
	}
	
	@PutMapping(value = "/user", headers = { "Content-type=application/json" })
	public List<MemberDto> userModify(@RequestBody MemberDto memberDto) {
		userService.userModify(memberDto);
		return userService.userList();
	}
	
	@DeleteMapping(value = "/user/{userid}", headers = { "Content-type=application/json" })
	public List<MemberDto> userDelete(@PathVariable("userid") String userid) {
		userService.userDelete(userid);
		return userService.userList();
	}
	
}
