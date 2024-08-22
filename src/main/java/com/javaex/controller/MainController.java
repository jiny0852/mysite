package com.javaex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {

	//필드
	@Autowired
	
	//생성자
	//메서드 gs
	//메서드 일반
	
	@RequestMapping(value="/main", method= {RequestMethod.GET, RequestMethod.POST})
	public String main() {
		
		System.out.println("시좌아아아아악");
		
		return "/main/index";
	}
	
	
	
	
	
	
	
	
	
	
}
