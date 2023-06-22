package com.fpp.controller.festivalList;


import java.io.IOException;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fpp.service.festivalDataSave.impl.FestivalDataSaveServiceImpl;
import com.fpp.service.festivalList.FestivalListService;
import com.fpp.dto.festivalList.FestivalListDto;
import com.fpp.scheduler.FestivalDataScheduler;

@Controller
public class FestivalListController {
	
	@Autowired
	FestivalListService festivalListService;
	
	@Autowired
	FestivalDataScheduler festivalDataScheduler;

	@RequestMapping("/festivalList")
	public String festivalList(Model model) throws IOException {

		List<FestivalListDto> List = festivalListService.lodeList();
		model.addAttribute("festivalList", List);
		
		festivalDataScheduler.festivalDataSave();
		
		//sqlSessionTemplate.selectList("reservation_mapper.select_reservation_list_by_searchKeyword", searchKeyword);
		return "festivalList";
	}


}
