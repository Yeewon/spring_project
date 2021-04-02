package com.yeewon.guestbook.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.yeewon.guestbook.model.MemberDto;
import com.yeewon.guestbook.model.service.UserService;
//import com.yeewon.util.PageNavigation;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "user/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@RequestParam Map<String, String> map, Model model, HttpSession session,
			HttpServletResponse response) {
		try {
			MemberDto memberDto = userService.login(map);
			if (memberDto != null) {
				session.setAttribute("userinfo", memberDto);

				Cookie cookie = new Cookie("yeewon_id", memberDto.getUserid());
				cookie.setPath("/");
				if ("saveok".equals(map.get("idsave"))) {
					cookie.setMaxAge(60 * 60 * 24 * 365 * 40);// 40년간 저장.
				} else {
					cookie.setMaxAge(0);
				}
				response.addCookie(cookie);

			} else {
				model.addAttribute("msg", "아이디 또는 비밀번호 확인 후 로그인해 주세요.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "로그인 중 문제가 발생했습니다.");
			return "error/error.jsp";
		}
		return "index";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET) 
	public String list() { 
		return "user/list"; 
	}

	@RequestMapping(value = "/booklist", method = RequestMethod.GET)
	public String booklist() {
		return "user/booklist";
	}

	/*
	 * @RequestMapping(value = "/list", method = RequestMethod.GET) public String
	 * list(@RequestParam Map<String, String> map, Model model) { String spp =
	 * map.get("spp"); map.put("spp", spp != null ? spp : "10");//sizePerPage try {
	 * List<MemberDto> list = userService.listMember(map); PageNavigation
	 * pageNavigation = userService.makePageNavigation(map);
	 * model.addAttribute("articles", list); model.addAttribute("navigation",
	 * pageNavigation); return "user/list"; } catch (Exception e) {
	 * e.printStackTrace(); model.addAttribute("msg", "글목록을 얻어오는 중 문제가 발생했습니다.");
	 * return "error/error"; } }
	 */

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		return "user/join";
	}
//	
//	@RequestMapping(value = "/join", method = RequestMethod.POST)
//	public String join(MemberDto memberDto) throws Exception {
//		userService.userRegister(memberDto);
//		return "index";
//	}

	@PostMapping(value = "/join", headers = { "Content-type=application/json" })
	public @ResponseBody List<MemberDto> userRegister(@RequestBody MemberDto memberDto) {
		userService.userRegister(memberDto);
		return userService.userList();
	}
}
