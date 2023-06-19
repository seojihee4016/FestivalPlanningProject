package com.fpp.controller.festivalList;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fpp.dto.FestivalList.FestivalListDto;
import com.fpp.service.festivalList.FestivalListService;

@Controller
public class FestivalListController {
	@Autowired
	FestivalListService festivalListService;

	@RequestMapping("/festivalList")
	public String festivalList(Model model) {

		List<FestivalListDto> List = festivalListService.lodeList();
		model.addAttribute("festivalList", List);

		//sqlSessionTemplate.selectList("reservation_mapper.select_reservation_list_by_searchKeyword", searchKeyword);
		return "festivalList";
	}


}
