package com.javaex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.GuestbookDao;
import com.javaex.vo.GuestbookVo;

@Service
public class GuestbookService {
	
	@Autowired
	private GuestbookDao guestbookDao;
	
	
	public List<GuestbookVo> exeGetList () {
		
		System.out.println("GuestbookService.exeGetList()");
		
		List<GuestbookVo> guestList = guestbookDao.getGuestbookList();
		
		return guestList;
		
	}
	
	public GuestbookVo exeInsert( GuestbookVo guestbookVo ) {
		
		System.out.println("GuestbokService.exeInsret()");
		
		GuestbookVo addGuestbook = guestbookDao.insertGuestbook(guestbookVo);
		
		return addGuestbook;
	}
	
	
	public GuestbookVo exeDelete( GuestbookVo guestbookVo ) {
		
		System.out.println("GuestbokService.exeDelete()");
		
		GuestbookVo deleteGuestbook = guestbookDao.deleteGuestbook(guestbookVo);
		
		return deleteGuestbook;
	}
	
	

}
