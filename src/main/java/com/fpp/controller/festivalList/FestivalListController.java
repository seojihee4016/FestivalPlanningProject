package com.fpp.controller.festivalList;

import java.io.IOException;
import java.util.List;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.fpp.service.festivalList.FestivalListService;
import com.fpp.dto.festivalData.FestivalDataDto;
import com.fpp.scheduler.FestivalInfoUpdate;


@Controller
public class FestivalListController {
	
	@Autowired
	FestivalListService festivalListService;
	
	@Autowired
	FestivalInfoUpdate festivalInfoUpdate;

	@RequestMapping("/festivalList")
	public String festivalList(Model model) throws IOException, ParseException {

		List<FestivalDataDto> List = festivalListService.loadList();
		model.addAttribute("festivalList", List);
		
		//festivalInfoUpdate.festivalInfoUpdateScheduler();
		
		return "festivalList";
	}


}
