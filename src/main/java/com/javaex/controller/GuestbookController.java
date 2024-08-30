package com.javaex.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.javaex.service.GuestbookService;
import com.javaex.vo.GuestbookVo;

@Controller
@RequestMapping ( value="/guestbook")
public class GuestbookController {
	
	@Autowired
	private GuestbookService guestbookService;
	
	
	/* 리스트-등록폼 */
	@RequestMapping ( value="/list", method={RequestMethod.GET, RequestMethod.POST}  )
	public String list ( Model model ) {
		
		System.out.println("guestbookController.list()");
		
		//메소드를 이용해서 저장한다
		List<GuestbookVo> guestbookList = guestbookService.exeGetList();
		
		//System.out.println(guestbookList);
		
		model.addAttribute("guestbookList", guestbookList);
		
		return "/guestbook/addList";
		
	}
	
	
	/* guestbook 등록 */
	@RequestMapping ( value="/insert", method={RequestMethod.GET, RequestMethod.POST}  )
	public String insert ( @ModelAttribute GuestbookVo guestbookVo ) {
		
		System.out.println("guestbookController.insert()");
		
		GuestbookVo addGuestbook = guestbookService.exeInsert(guestbookVo);
		
		//System.out.println(addGuestbook);
		
		return "redirect:/guestbook/list";
		
	}
	
	
	/* 삭제폼 */
	@RequestMapping ( value="/deleteform", method={RequestMethod.GET, RequestMethod.POST}  )
	public String deleteForm( ) { //@RequestParam(value="no") int no ) {
		
		System.out.println("guestbookController.deleteForm()");
		
		//System.out.println(no);
		
		return "/guestbook/deleteForm";
		
	}
	
	
	/* 삭제 */
	@RequestMapping ( value="/delete", method= { RequestMethod.GET, RequestMethod.POST } )
	public String delete ( @ModelAttribute GuestbookVo guestbookVo ) {
			
			/*@RequestParam(value="no") int no , 
						   @RequestParam(value="password") String password  ) {*/
		
		System.out.println("guestbookController.delete()");
		
		GuestbookVo deleteGuestbookVo = guestbookService.exeDelete(guestbookVo);
		
		//System.out.println(deleteGuestbookVo);

		
		return "redirect:/guestbook/list";
	} 
	
	
	// ########################################################################
	/* ajax index */
	@RequestMapping ( value="/ajaxindex", method={RequestMethod.GET, RequestMethod.POST}  )
	public String ajaxindex (  ) {
		
		System.out.println("guestbookController.ajaxindex()");
		
		//방명록 데이터 리스트 가져오지 않는다		
		
		return null; //"/guestbook/ajaxindex";
		
	}
	
	
	
	
	
	
	
	

}
