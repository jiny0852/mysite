package com.javaex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.javaex.service.UserService;

@Controller
public class UserController {

	//필드
	@Autowired
	private UserService userService;
	
	//생성자
	//메서드 gs
	//메서드 일반
	
	/* joinForm */
	@RequestMapping (value="/joinform", method= {RequestMethod.GET, RequestMethod.POST})
	public String joinForm() {
		
		System.out.println("userController.joinform()");
		
		return "/user/joinForm";
		
	}
	
	/* join */
	@RequestMapping (value="/join", method= {RequestMethod.GET, RequestMethod.POST} )
	public String join() {
		
		System.out.println("userController.join()");
		
		
		return "/user/joinOk";
	}
	
	
	
	
	
	
	
}
