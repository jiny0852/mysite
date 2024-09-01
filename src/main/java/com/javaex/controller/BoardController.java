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
import com.javaex.vo.UserVo;

import jakarta.servlet.http.HttpSession;


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
		
		System.out.println(boardVo);
		
		model.addAttribute("boardVo", boardVo);		
		
		
		return "/board/read";
	}
	
	/* writeform */
	@RequestMapping ( value="/board/writeform", method={RequestMethod.GET, RequestMethod.POST} )
	public String writeform () {
		
		System.out.println("boardController.writeform()");
		
		return "/board/writeForm";
	}
	
	/* write */
	@RequestMapping ( value="/board/write", method={RequestMethod.GET, RequestMethod.POST} )
	public String write ( @ModelAttribute BoardVo boardVo ) {  //, HttpSession session ) {
		
		System.out.println("boardController.write()");
		
		System.out.println(boardVo);
		
		//System.out.println((Integer)session.getAttribute("authUser"));
		
		//UserVo authUser = (UserVo)session.getAttribute("authUser");
		
		BoardVo insertVo = boardVo;
		//boardVo.setUserNo( authUser.getNo() );
		//boardVo.setUserName( authUser.getName() );
		
		//boardVo.setUserNo( (BoardVo)session.getAttribute("authUser").getNo() );
		//boardVo.setUserName( (BoardVo)session.getAttribute("authUser").getName() );
		
		
		
		BoardVo returnVo = boardService.exeGetInsert(boardVo);
		
		
		
		return "redirect:/board/list";
	}
	
	
	/* modifyForm */
	@RequestMapping ( value="/board/modifyform", method={RequestMethod.GET, RequestMethod.POST} )
	public String modifyform ( @RequestParam(value="no") int no, Model model ) {
		
		System.out.println("boardController.modifyform()");
		
		BoardVo boardVo = boardService.exeGetReadOne(no);
		
		model.addAttribute("boardVo", boardVo);	
		
		System.out.println(boardVo);
		
		return "/board/modifyForm";
	}
	
	
	/* modify */
	@RequestMapping ( value="/board/modify", method={RequestMethod.GET, RequestMethod.POST} )
	public String modify ( @ModelAttribute BoardVo boardVo ) {
		
		System.out.println("boardController.modify()");
		
		BoardVo updateVo = boardService.exeUpdate(boardVo);		
		
		System.out.println(updateVo);
		
		return "redirect:/board/list";
	}
	  
	
	
	
	
	
	
	
	
	
	
}
