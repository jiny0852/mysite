package com.javaex.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.javaex.service.BoardService;
import com.javaex.vo.BoardVo;
import com.javaex.vo.GuestbookVo;


@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	
	
	
	/* board List Main */
	@RequestMapping ( value="/board/list", method={RequestMethod.GET, RequestMethod.POST} )
	public String list ( Model model ) {
		
		System.out.println("boardController.list()");
		
		List<BoardVo> boardList = boardService.exeGetBoardList();
		
		model.addAttribute("boardList", boardList);
		
		
		return "/board/list";
				
	}
	
	/* board read Page */
	@RequestMapping ( value="/board/read", method={RequestMethod.GET, RequestMethod.POST} )
	public String read ( @RequestParam(value="no") int no, Model model ) {
		
		System.out.println("boardController.read()");
		
		BoardVo boardVo = boardService.exeGetReadOne(no);
		
		model.addAttribute("boardVo", boardVo);		
		
		
		return "/board/read";
	}
	
	
	
	
	
	
	
	
	
	
	
}
