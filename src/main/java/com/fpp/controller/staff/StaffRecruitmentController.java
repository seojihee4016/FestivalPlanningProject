package com.fpp.controller.staff;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fpp.dto.staff.StaffDto;
import com.fpp.service.staff.StaffService;

@Controller
public class StaffRecruitmentController {
	
	@Autowired
	StaffService staffService;
	
	//스탭 모집 양식 작성 페이지
	@GetMapping("/staffRecruitment_form")
	public String staffRecruitment_form() {
		return "staffRecruitment_form";
	}
	
	@PostMapping("/staffRecruitment_form")
	public String staffRecruitment_form_process(StaffDto staffDto) {
		
		staffService.recruitmentStaff(staffDto);
		
		return "redirect:/staffRecruitmentList";
	}
	
	
	
	//스탭 모집 리스트 페이지
	@GetMapping("/staffRecruitmentList")
	public String staffRecruitmentList(Model model) {
		
		List<StaffDto> staffRecruitmentList =
				staffService.getStaffRecruitmentList();
		model.addAttribute("staffRecruitmentList", staffRecruitmentList);
		
		return "staffRecruitmentList";
	}
	
	//스탭 모집 페이지
	@GetMapping("/staffRecruitment")
	public String staffRecruitmentListByFestivalName(Model model, 
								@RequestParam("festivalName") String festivalName) {
		
		//축제명을 기반으로 리스트 출력하기
		 List<StaffDto> staffRecruitmentListByFestivalName = 
				 staffService.getStaffRecruitmentListByFestivalName(festivalName);
		model.addAttribute("staffRecruitmentListByFestivalName", staffRecruitmentListByFestivalName);
		
		return "staffRecruitment";
	}

}
