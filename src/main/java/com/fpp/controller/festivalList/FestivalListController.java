package com.fpp.controller.festivalList;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
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

	@RequestMapping("/festivalList")
	public String festivalList(Model model) throws IOException, ParseException {

		List<FestivalDataDto> list = festivalListService.loadList();
		
		List<FestivalDataDto> refineList = new ArrayList<FestivalDataDto>();
		for (int i=0; i<list.size(); i++) {
			FestivalDataDto data = list.get(i);
			if (data.getRdnmadr()==null) {
				data.setRdnmadr(data.getLnmadr());
			}
			refineList.add(data);
		}
		
		model.addAttribute("festivalList", refineList);
		
		return "festivalList";
	}


}
