package com.javaex.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.UserVo;


@Repository
public class UserDao {
	
	//필드
	@Autowired
	private SqlSession sqlSession;
	
	//생성자
	//메서드 gs
	//메서드 일반
	
	public int insertUser( UserVo userVo  ) {
		
		System.out.println("UserDao.insertUser()");
		
		System.out.println(userVo);
		
		int count = sqlSession.insert("user.insert", userVo);
		
		return count;
		
	}
	
	
	public UserVo selectUser ( UserVo userVo ) {
		
		System.out.println("UserDao.selectUser()");
		
		System.out.println(userVo);
		
		UserVo authUser = sqlSession.selectOne("user.selectByIdPw", userVo);
		
		return authUser;
		
	}

}
