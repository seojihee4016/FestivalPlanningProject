package com.fpp.controller.bulletinBoard;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fpp.dto.board.FormDto;
import com.fpp.dto.bulletinBoard.BulletinBoardDto;
import com.fpp.dto.bulletinBoard.PageMaker;
import com.fpp.dto.bulletinBoard.SearchCriteria;
import com.fpp.dto.bulletinBoard.Criteria;
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

	//게시판 글 리스트 페이지 - 페이지 네이션 추가
	@GetMapping("/bulletinBoardList")
	public String bulletinBoardList(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception{

		model.addAttribute("selectBulletinBoardList", bulletinBoardService.selectBulletinBoardList(scri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(bulletinBoardService.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);
		return "bulletinBoardList";	
	}

	//게시글 수정
	@GetMapping("/bulletinBoardProcess")
	public String bulletinBoardProcess(BulletinBoardDto bulletinBoardDto, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{

		model.addAttribute("updateBulletinBoard", bulletinBoardService.selectBulletinBoardListByBno(bulletinBoardDto.getBno()));
		model.addAttribute("scri", scri);

		return "bulletinBoardProcess";
	}

	// 게시글 수정 이후 리스트로 이동 - 페이징 유지 기능 추가
	@PostMapping("/bulletinBoardProcess")
	public String update(BulletinBoardDto bulletinBoardDto, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception{

		bulletinBoardService.updateBulletinBoard(bulletinBoardDto);

		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());

		return "redirect:/bulletinBoardList";
	}	

	// 게시글 삭제
	@PostMapping("/deleteBulletinBoardByBno")
	public String deleteBulletinBoard(BulletinBoardDto bulletinBoardDto, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception{

		bulletinBoardService.deleteBulletinBoardByBno(bulletinBoardDto.getBno());

		rttr.addFlashAttribute("scri", scri);

		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());

		return "redirect:/bulletinBoardList";
	}

}