package com.fpp.controller.staff;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.expression.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import com.fpp.dto.board.FormDto;
import com.fpp.dto.staff.StaffApplyDto;
import com.fpp.dto.staff.StaffDto;
import com.fpp.service.applicationForm.BoardService;
import com.fpp.service.staff.StaffService;

@Controller
public class StaffRecruitmentController {
	
	@Autowired
	StaffService staffService;
	
	@Autowired
	BoardService boardService;
	
	//스탭 모집 공고 작성 페이지
	@GetMapping("/staffRecruitment_form")
	public String staffRecruitment_form(@RequestParam("fno") int fno, Model model) throws Exception {
		
	    // 해당 축제의 데이터 가져오기
	    FormDto formDto = boardService.read(fno);
	    
	    // 모델에 추가하여 뷰로 전달
	    model.addAttribute("formDto", formDto);
		
		return "staffRecruitment_form";
	}
	
	@PostMapping("/staffRecruitment_form")
	public String staffRecruitment_form_process(StaffDto staffDto, /*FormDto formDto, */
				  Model model ) throws Exception {
		
		//스탭 모집 공고 등록
		staffService.recruitmentStaff(staffDto);
		
		/*
		// 신청 양식 번호로 확인하기
	    int fno = formDto.getFno(); // FormDto에서 fno 값을 가져옴
	    FormDto readFormDto = boardService.read(fno);
	    model.addAttribute("formDto", readFormDto);
		*/
		
		/*
		 * //신청 양식 불러오기 List<FormDto> formList = boardService.list();
		 * model.addAttribute("formList", formList);
		 */
		
		return "redirect:/staffRecruitmentList";
	}
	
	//스탭 모집 공고 리스트 페이지
	@GetMapping("/staffRecruitmentList")
	public String staffRecruitmentList(Model model) throws Exception {
		
		List<FormDto> formlist =
				boardService.list();
		

		model.addAttribute("formlist", formlist);
		
		return "staffRecruitmentList";
	}
	
	//스탭 신청 페이지
	@GetMapping("/staffRecruitment")
	public String staffRecruitment(@RequestParam("fno") int fno,
			/* @Valid @RequestBody FormDto formDtoByFno, */
			/* @PathVariable(value="fno", required = false) */
			/* FormDto formDto, StaffDto staffDto, */ Model model/*, 
			BindingResult bindingResult*/) throws Exception {
		
		//Form
		// 해당 축제의 데이터 가져오기
		FormDto formDtoByFno = boardService.read(fno);
		
		
		/*
		 * if (bindingResult.hasErrors()) { System.out.println("bindingResult = " +
		 * bindingResult.getAllErrors()); return "valid :: #form"; }
		 */
		
		//formDto.getFno();를 가져오는데 fno < 0인 경우 유효성 검사 추가
		//http://localhost:8080/updateView로 들어가는 경우에는 list 로 이동
		/*
		fno = formDtoByFno.getFno();
	    if (fno < 0 || fno !=  ) {
	        return "list";
	    }
	    */
		 
		
		// 모델에 추가하여 뷰로 전달
	    model.addAttribute("formDtoByFno", formDtoByFno);
	    
	    //Staff
        // 스탭 모집 목록 데이터 조회
        StaffDto staffRecruitment = staffService.getStaffRecruitment(fno);
        model.addAttribute("staffRecruitment", staffRecruitment);
		
		
		return "staffRecruitment";
	}
	
	@PostMapping("/staffRecruitment")
	public String staffRecruitment_process (StaffApplyDto staffApplyDto
				  //Model model 
				  
				  /*, 
				  @RequestParam("supportPeriodStart") String supportPeriodStart,
			      @RequestParam("supportPeriodEnd") String supportPeriodEnd,
			      */) {
//		
//		// 유효성 검사 통과 시, staffApplyDto를 이용해 스탭 모집에 지원 등록
		staffService.staffRecruitmentApply(staffApplyDto);
//		
//		// 신청 양식 번호로 확인하기
//	    int fno = formDto.getFno(); // FormDto에서 fno 값을 가져옴
//	    FormDto readFormDto = boardService.read(fno);
//	    model.addAttribute("formDto", readFormDto);
//		/*
//	    DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
//	    try {
//	        LocalDate startDate = LocalDate.parse(supportPeriodStart, dateFormatter);
//	        LocalDate endDate = LocalDate.parse(supportPeriodEnd, dateFormatter);
//
//	        if (endDate.isBefore(startDate)) {
//	            model.addAttribute("error", "지원기간을 다시 확인해 주세요.");
//	            
//	         // 스탭 모집 목록 데이터 조회
//	            List<StaffDto> staffRecruitmentListByFestivalName = staffService.getStaffRecruitmentListByFestivalName(festivalName);
//	            model.addAttribute("staffRecruitmentListByFestivalName", staffRecruitmentListByFestivalName);
//	            return "staffRecruitment";
//	        }
//
//	        
//	        
//	        
//	    } catch (ParseException e) {
//	        // 날짜 형식이 올바르지 않은 경우 예외 처리
//	        model.addAttribute("error", "Invalid date format");
//	        return "staffRecruitment";
//	    }
//	    */
//
	    return "redirect:/staffRecruitmentList";
	}

}
