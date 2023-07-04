package com.fpp.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.fpp.dto.bulletinBoard.SearchCriteria;
import com.fpp.service.applicationForm.BoardService;

@Controller
public class AdminController {

	@Autowired
	BoardService boardService;

	@GetMapping("/admin")
	public String admin(Model model) throws Exception {
		
		
		model.addAttribute("list", boardService.list2());
		return "admin";
	}
}
