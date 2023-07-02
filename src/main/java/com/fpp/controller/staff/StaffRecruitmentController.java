package com.fpp.controller.staff;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.expression.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fpp.dto.staff.StaffApplyDto;
import com.fpp.dto.staff.StaffDto;
import com.fpp.service.staff.StaffService;

@Controller
public class StaffRecruitmentController {
	
	@Autowired
	StaffService staffService;
	
	//스탭 모집 공고 작성 페이지
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
//	@GetMapping("/staffRecruitment")
//	public String staffRecruitmentListByFestivalName() {
//		return "staffRecruitment";
//	}
	
	@GetMapping("/staffRecruitment")
	public String staffRecruitmentListByFestivalName(Model model, 
				  @RequestParam("festivalName") String festivalName) {
		
		//축제명을 기반으로 리스트 출력하기
		 List<StaffDto> staffRecruitmentListByFestivalName = 
				 staffService.getStaffRecruitmentListByFestivalName(festivalName);
		model.addAttribute("staffRecruitmentListByFestivalName", staffRecruitmentListByFestivalName);
		
		return "staffRecruitment";
	}
	
	@PostMapping("/staffRecruitment")
	public String staffRecruitmentListByFestivalName_process (Model model,
				  @RequestParam("festivalName") String festivalName, 
				  @RequestParam("supportPeriodStart") String supportPeriodStart,
			      @RequestParam("supportPeriodEnd") String supportPeriodEnd,
			      StaffApplyDto staffApplyDto) {
	    DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	    try {
	        LocalDate startDate = LocalDate.parse(supportPeriodStart, dateFormatter);
	        LocalDate endDate = LocalDate.parse(supportPeriodEnd, dateFormatter);

	        if (endDate.isBefore(startDate)) {
	            model.addAttribute("error", "지원기간을 다시 확인해 주세요.");
	            
	         // 스탭 모집 목록 데이터 조회
	            List<StaffDto> staffRecruitmentListByFestivalName = staffService.getStaffRecruitmentListByFestivalName(festivalName);
	            model.addAttribute("staffRecruitmentListByFestivalName", staffRecruitmentListByFestivalName);
	            return "staffRecruitment";
	        }

	        // 유효성 검사 통과 시, staffApplyDto를 이용해 스탭 모집에 지원 등록
	        staffService.staffRecruitmentApply(staffApplyDto);
	        
	    } catch (ParseException e) {
	        // 날짜 형식이 올바르지 않은 경우 예외 처리
	        model.addAttribute("error", "Invalid date format");
	        return "staffRecruitment";
	    }

	    return "redirect:/staffRecruitmentList";
	}

}
