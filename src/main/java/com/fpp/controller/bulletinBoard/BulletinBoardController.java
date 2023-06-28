package com.fpp.controller.bulletinBoard;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fpp.dto.board.FormDto;
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

	//게시판 글 리스트 페이지
	@GetMapping("/bulletinBoardList")
	public String bulletinBoardList(Model model)  throws Exception{

		model.addAttribute("selectBulletinBoardList", bulletinBoardService.selectBulletinBoardList());
		return "bulletinBoardList";
	}

	// 게시판 읽기 /수정 / 삭제 가능한 페이지로 이동 - 화면 연결
	@GetMapping("/bulletinBoardProcess")
	public String bulletinBoardProcess(@Validated BulletinBoardDto bulletinBoardDto, Model model,  BindingResult bindingResult) throws Exception{

		bulletinBoardDto.getBno();

		if (bindingResult.hasErrors()) {
			System.out.println("bindingResult = " + bindingResult.getAllErrors());
			return "valid :: #form";
		}
		
		model.addAttribute(
				"updateBulletinBoard",
				bulletinBoardService.selectBulletinBoardListByBno(bulletinBoardDto.getBno()));
		return "bulletinBoardProcess";
	}
	
	
	// 게시글 수정 이후 리스트로 이동
	@PostMapping("/bulletinBoardProcess")
	public String updateBulletinBoard(BulletinBoardDto bulletinBoardDto) throws Exception{
		bulletinBoardService.updateBulletinBoard(bulletinBoardDto);
		return "redirect:/bulletinBoardList";
	}
	
	// 게시글 삭제
	@PostMapping("/deleteBulletinBoardByBno")
	public String deleteBulletinBoard(BulletinBoardDto bulletinBoardDto) throws Exception{
		bulletinBoardService.deleteBulletinBoardByBno(bulletinBoardDto.getBno());
		return "redirect:/bulletinBoardList";
	}


}
