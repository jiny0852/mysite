package com.javaex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.javaex.service.GalleryService;

@Controller
public class GalleryController {
	
	@Autowired
	//private GalleryService galleryService;
	
	
	
	
	/* 갤러리 메인 진입  */
	@RequestMapping ( value="/gallery/listform", method={RequestMethod.GET, RequestMethod.POST}  )
	public String listform () {
		
		System.out.println("GalleryController.listform()");		
		
	
		return "/gallery/list";
		
	}
	
	
	
	
	
	
	
	
	
	
	

}
