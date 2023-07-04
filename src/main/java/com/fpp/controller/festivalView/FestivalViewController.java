package com.fpp.controller.festivalView;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.fpp.dto.festivalData.FestivalDataDto;
import com.fpp.service.festivalView.FestivalViewService;

@Controller
public class FestivalViewController {
	
	@Autowired
	FestivalViewService festivalViewService;
	
	@PostMapping("/festivalView")
	public String festivalView() {
		
		return "redirect:festivalList";
	}
	
	@GetMapping("/festivalView")
	public String festivalView(HttpServletRequest request, Model model) {
		
		String code = request.getParameter("ftCode");
		FestivalDataDto detailInfo = festivalViewService.loadDetailInfo(code);
		if(detailInfo.getLnmadr()==null) {
			model.addAttribute("festivalAddress", detailInfo.getRdnmadr());
		} else {
			model.addAttribute("festivalAddress", detailInfo.getLnmadr());
		}
		
		
		model.addAttribute("festivalDetailInfo", detailInfo);
		return "festivalView";	
	}
	
}
