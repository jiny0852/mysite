package com.javaex.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.UserDao;
import com.javaex.vo.UserVo;

@Service
public class UserService {
	
	//필드
	@Autowired
	private UserDao userDao;
	
	//생성자
	//메서드 gs
	//메서드 일반
	
	public int exeJoinUser( UserVo userVo ) {
		
		System.out.println("UserService.exeJoinUser()");
		
		System.out.println("UserService.exeJoinUser(userVo) : " + userVo);
		
		int count = userDao.insertUser(userVo);
		
		return count;
		
	}
	
	public UserVo exeLogin ( UserVo userVo ) {
		
		System.out.println("UserService.exeLogin()");
		
		UserVo authUser = userDao.selectUser(userVo);
		
		return authUser;
		
	}
	
	
	

}
