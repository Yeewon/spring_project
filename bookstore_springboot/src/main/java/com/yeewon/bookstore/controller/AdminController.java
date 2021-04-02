package com.yeewon.bookstore.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.yeewon.bookstore.model.MemberDto;
import com.yeewon.bookstore.model.service.UserService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;

@RestController
@Api("Admin Controller V1")
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private UserService userService;
	
	@ApiOperation(value = "회원 목록", notes = "회원 목록을 반환해준다.")
	@ApiResponses({
		@ApiResponse(code = 200, message = "성공"),
		@ApiResponse(code = 404, message = "없는 페이지")
	})
	@GetMapping(value = "/user", headers = { "Content-type=application/json" })
	public List<MemberDto> userList() {
		return userService.userList();
	}
	
	@ApiOperation(value = "회원 등록", notes = "회원 정보를 받아서 처리 해준다. ")
	@PostMapping(value = "/user", headers = { "Content-type=application/json" })
	public List<MemberDto> userRegister(@RequestBody @ApiParam(value = "회원 정보를 갖는 객체", required = true) MemberDto memberDto) {
		userService.userRegister(memberDto);
		return userService.userList();
	}
	
	@ApiOperation(value = "회원 정보", notes = "회원 한명의 정보를 받아온다. ")
	@GetMapping(value = "/user/{userid}", headers = { "Content-type=application/json" })
	public MemberDto userInfo(@PathVariable("userid") @ApiParam(value = "검색할 회원의 아이디") String userid) {
		return userService.userInfo(userid);
	}
	
	@ApiOperation(value = "회원 정보 수정", notes = "회원 정보를 수정한다. ")
	@PutMapping(value = "/user", headers = { "Content-type=application/json" })
	public List<MemberDto> userModify(@RequestBody @ApiParam(value = "수저할 회원의 정보를 갖는 객체") MemberDto memberDto) {
		userService.userModify(memberDto);
		return userService.userList();
	}
	
	@ApiOperation(value = "회원 정보 삭제", notes = "회원 한명의 정보를 삭제한다. ")
	@DeleteMapping(value = "/user/{userid}", headers = { "Content-type=application/json" })
	public List<MemberDto> userDelete(@PathVariable("userid") @ApiParam(value = "삭제할 회원의 아이디") String userid) {
		userService.userDelete(userid);
		return userService.userList();
	}
	
}
