package com.fpp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fpp.service.BoardService;
import com.fpp.dto.board.BoardDto;

@Controller
public class BoardController {


	@Autowired
	BoardService boardService;

	/*게시판 글 작성*/
	//localhost:8080/writeView
	@GetMapping("/writeView")  
	public String writeView() {
		return "writeView";
	}


	@PostMapping("/list")  
	public String boardWriteList(BoardDto boardDto) throws Exception {
		//여기서 null 값 넘어가면 500 오류 -> null일 경우 조건 추가
		boardService.write(boardDto);
		return "list";
	}



	/*게시판 목록 조회*/
	@GetMapping("/list")
	public String list(Model model) throws Exception{

		model.addAttribute("list", boardService.list());


		return "list";

	}

	// 게시글 번호 조회
	@GetMapping("/readView")
	public String read(BoardDto boardDto, Model model) throws Exception{

		model.addAttribute("read", boardService.read(boardDto.getBno()));

		return "readView";
	}


	// 게시판 수정뷰
	@RequestMapping(value = "/**/updateView", method = RequestMethod.GET)
	public String updateView(BoardDto boardDto, Model model) throws Exception{

		model.addAttribute("update", boardService.read(boardDto.getBno()));

		return "updateView";
	}

	// 게시판 수정
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(BoardDto boardDto) throws Exception{
		boardService.update(boardDto);

		return "redirect:/list";
	}

	// 게시판 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(BoardDto boardDto) throws Exception{

		boardService.delete(boardDto.getBno());

		return "redirect:/list";
	}
	
	@RequestMapping("/applicationForm")
	public String applicationForm() {

		return "applicationForm";
	}



}





