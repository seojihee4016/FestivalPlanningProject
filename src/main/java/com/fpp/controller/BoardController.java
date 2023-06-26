package com.fpp.controller;

import javax.validation.constraints.PastOrPresent;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fpp.service.BoardService;
import com.fpp.dto.board.BoardDto;
import com.fpp.dto.board.FormDto;

@Controller
public class BoardController {

	@Autowired
	BoardService boardService;

	/*신청 양식 작성*/
	//localhost:8080/applicationForm
	@RequestMapping("/applicationForm")  
	public String applicationForm() {
		return "applicationForm";
	}

	// 신청 양식 작성
	@RequestMapping(value = "/applicationForm", method = RequestMethod.POST)
	public String write(FormDto formDto) throws Exception{
		boardService.write(formDto);
		return "redirect:/list";
	}

	// 신청 양식 목록 조회 
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model) throws Exception{
		model.addAttribute("list",boardService.list());
		return "list";
	}

	// 신청 양식 수정뷰로 이동 - 화면 연결
	@GetMapping("/updateView")
	public String updateView(@Validated FormDto formDto, Model model,  BindingResult bindingResult) throws Exception{
		/*formDto.getFno();를 가져오는데 fno < 0인 경우 유효성 검사 추가
		http://localhost:8080/updateView로 들어가는 경우에는 list 로 이동
		  int fno = formDto.getFno();
		    if (fno < 0 || fno = ) {
		        return "list";
		    }
		 */
		formDto.getFno();
		System.out.println("formDto.getFno() = " + formDto.getFno()+" "+bindingResult.hasErrors());
		if (bindingResult.hasErrors()) {
			System.out.println("bindingResult = " + bindingResult.getAllErrors());
			return "valid :: #form";
		}
		model.addAttribute("update", boardService.read(formDto.getFno()));
		//model.addAttribute("read", boardService.read(formDto.getFno()));

		return "updateView";
	}


	// 신청 양식 수정 이후 list로 이동
	@PostMapping("/updateView")
	public String update(FormDto formDto) throws Exception{
		boardService.update(formDto);
		return "redirect:/list";
	}

	// 신청 양식 삭제
	@PostMapping("/delete")
	public String delete(FormDto formDto) throws Exception{
		boardService.delete(formDto.getFno());
		return "redirect:/list";
	}

}





