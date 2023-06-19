package com.fpp.controller.festivalView;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class FestivalViewController {
	
	
	@GetMapping("/festivalView")
	public String festivalView() {
		
		return "festivalList";	
	}
	
	@PostMapping("/festivalView")
	public String festivalView(Model model) {
		
		
		
		return "festivalView";
	}
	
}
