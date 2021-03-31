package com.yeewon.guestbook;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.yeewon.guestbook.model.GuestBookDto;
import com.yeewon.guestbook.model.service.GuestBookService;

public class GuestbookTest extends Configure{
	@Autowired
	private GuestBookService guestBookService;
	
	@Test
	public void getArticle() throws Exception {
		GuestBookDto dto = new GuestBookDto();
		dto.setUserid("yeewon");
		dto.setSubject("test 제목");
		dto.setContent("test 내용");
		guestBookService.writeArticle(dto);
		
		System.out.println(dto.getUserid());
	}
}
