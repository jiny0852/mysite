package com.javaex.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.javaex.service.GuestbookService;
import com.javaex.vo.GuestbookVo;

@Controller
public class GuestbookController {
	
	@Autowired
	private GuestbookService guestbookService;
	
	
	/* 리스트-등록폼 */
	@RequestMapping ( value="/guestbook/list", method={RequestMethod.GET, RequestMethod.POST}  )
	public String list ( Model model ) {
		
		System.out.println("guestbookController.list()");
		
		//메소드를 이용해서 저장한다
		List<GuestbookVo> guestbookList = guestbookService.exeGetList();
		
		System.out.println(guestbookList);
		
		model.addAttribute("guestbookList", guestbookList);
		
		return "/guestbook/addList";
		
	}
	
	
	/* 등록 */
	@RequestMapping ( value="/insert", method={RequestMethod.GET, RequestMethod.POST}  )
	public String insert ( @ModelAttribute GuestbookVo guestbookVo ) {
		
		System.out.println("guestbookController.insert()");
		
		System.out.println(guestbookVo);

		
		//메소드를 이용해서 저장한다
		int count = 0;//guestbookService.exeInsert(guestbookVo);
		System.out.println(count);
		
		//리스트로 리다이렉트
		return "redirect:/addList";
		
	}
	
	

}
