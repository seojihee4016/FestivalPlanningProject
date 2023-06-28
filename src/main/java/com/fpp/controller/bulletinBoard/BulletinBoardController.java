package com.fpp.controller.bulletinBoard;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fpp.dto.bulletinBoard.BulletinBoardDto;
import com.fpp.dto.staff.StaffDto;
import com.fpp.service.bulletinBoard.BulletinBoardService;

@Controller
public class BulletinBoardController {

	@Autowired
	BulletinBoardService bulletinBoardService;

	// 게시판 글 작성
	@GetMapping("/BulletinBoard") 
	public String BulletinBoard() {
		return "BulletinBoard";
	}

	@PostMapping("/BulletinBoard")
	public String insertBulletinBoard_process(BulletinBoardDto bulletinBoardDto) throws Exception{
		bulletinBoardService.insertBulletinBoard(bulletinBoardDto);
		return "redirect:/bulletinBoardList";
	}

	//게시판 글  리스트 페이지
	@GetMapping("/bulletinBoardList")
	public String bulletinBoardList(Model model)  throws Exception{

		model.addAttribute("selectBulletinBoardList", bulletinBoardService.selectBulletinBoardList());
		return "bulletinBoardList";
	}


	
}
