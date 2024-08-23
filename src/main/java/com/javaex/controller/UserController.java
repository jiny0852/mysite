package com.javaex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.javaex.service.UserService;
import com.javaex.vo.UserVo;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

	//필드
	@Autowired
	private UserService userService;
	
	//생성자
	//메서드 gs
	//메서드 일반
	
	/* joinForm */
	@RequestMapping ( value="/user/joinform", method= {RequestMethod.GET, RequestMethod.POST})
	public String joinForm() {
		
		System.out.println("userController.joinform()");
		
		return "/user/joinForm";
		
	}
	
	/* join */
	@RequestMapping ( value="/user/joinUser", method= {RequestMethod.GET, RequestMethod.POST} )
	public String join( @ModelAttribute UserVo userVo  ) {
		
		System.out.println("userController.joinUser()");
		
		int count = userService.exeJoinUser(userVo);
		
		if(count == 1) {}
		return "/user/joinOk";
		
	}
	
	
	/* loginForm */
	@RequestMapping ( value="/user/loginform", method= {RequestMethod.GET, RequestMethod.POST} )
	public String loginForm() {
		
		System.out.println("userController.loginform()");
		
		return "/user/loginForm";
		
	}
	
	
	/* login */
	@RequestMapping ( value="/user/login", method= {RequestMethod.GET, RequestMethod.POST} )
	public String login( @ModelAttribute UserVo userVo, HttpSession session ) {
		
		System.out.println("userController.login()");
		
		System.out.println(userVo);
		
		UserVo authUser = userService.exeLogin(userVo);
		
		System.out.println(authUser);
		
		//로그인(세션 영역에 저장)
		session.setAttribute("authUser", authUser); 
		//3시간 버티는 메모리 session에 값 넣어주는게 로그인 이라고 부르기로헀심
		//힙 말고 세션 이라는 것이 (영역이?) 메모리에 있다
		
		
		
		//if(count == 1) {}
		//메인페이지로 리다이렉트
		return "redirect:/main";
		
	}
	
	/* loginOut */
	@RequestMapping ( value="/user/logout", method= {RequestMethod.GET, RequestMethod.POST} )
	public String logout ( HttpSession session ) {
		
		System.out.println("userController.logout()");
		
		//session.removeAttribute("authUser"); //방의 데이터를 지움 , 특정데이터를 지움
		session.invalidate(); //방을 폭파 공간을 폭파, 번호표 새로 받음
		
		return "redirect:/main";
		
	}
	
	
	/* editForm */
	@RequestMapping ( value="/user/editform", method= {RequestMethod.GET, RequestMethod.POST} )
	public String editform ( Model model, HttpSession session ) {
		
		System.out.println("userController.editForm()");
		
		
		return "/user/modifyForm";
	}
	
	/* editForm */
	@RequestMapping ( value="/user/editform", method= {RequestMethod.GET, RequestMethod.POST} )
	public String editform ( Model model, HttpSession session ) {
		
		System.out.println("userController.editForm()");
		
		
		return "/user/modifyForm";
	}
	
	
	
	
	
	
	
}
