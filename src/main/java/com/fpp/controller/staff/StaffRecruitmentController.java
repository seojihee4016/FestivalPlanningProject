package com.fpp.controller.staff;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.expression.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fpp.dto.board.FormDto;
import com.fpp.dto.staff.StaffApplyDto;
import com.fpp.dto.staff.StaffBySrnoDto;
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
	public String staffRecruitment_form_process(@RequestParam("fno") int fno, 
				  Model model, @ModelAttribute StaffDto staffDto,
				  BindingResult bindingResult, RedirectAttributes redirectAttributes
				  ) throws Exception {
		
		//모집 공고 중복 업로드 확인
		FormDto formDto = boardService.read(fno);
	    //int srno = staffDto.getSRNO();
	    
	    //StaffDto List 중 SRNO 가져와서 중복 체크하기
		List<StaffDto> staffList = staffService.getStaffRecruitmentList();
	    // 중복 여부 확인
	    for (StaffDto staff : staffList) {
	        if (staff.getSRNO() == formDto.getFno()) {
	        	redirectAttributes.addFlashAttribute("errorFno", "이미 업로드된 모집 공고입니다.");
	        	return "redirect:/staffRecruitment_form?fno=" + fno;
	        }
	    }
		
		/*
	    if (srno == formDto.getFno()) {
	        //model.addAttribute("errorFno", "이미 업로드된 모집 공고입니다."); //redirect:/시 파라미터값이 전달되지 않음
	    	redirectAttributes.addFlashAttribute("errorFno", "이미 업로드된 모집 공고입니다.");
	    	return "redirect:/staffRecruitment_form?fno=" + fno; // 오류가 있는 경우 다시 해당 페이지를 표시
	    }*/
	    
	    
//	    Map<String, String> errors = new HashMap<>();
	    
	    if (ObjectUtils.isEmpty(staffDto.getRecruitmentTO())) {
	        bindingResult.addError(new FieldError("staffDto"
	                    , "recruitmentTO"
	                    , "모집 인원을 입력해 주세요."));
	    }
	    if (ObjectUtils.isEmpty(staffDto.getApplicationPeriod())) {
	        bindingResult.addError(new FieldError("staffDto"
	                    , "applicationPeriod"
	                    , "접수 기간을 입력해 주세요."));
	    }
	    
	 // 검증에 실패하면 다시 입력 폼으로
	    if (bindingResult.hasErrors()) {
	        return "redirect:/staffRecruitment_form?fno=\" + fno";
	    }
	    
	    //모집 공고 업로드
	    staffService.recruitmentStaff(staffDto);
	    
	    return "redirect:/staffRecruitmentList";
	}
	
	
	//스탭 모집 공고 리스트 페이지
	@GetMapping("/staffRecruitmentList")
	public String staffRecruitmentList(Model model) throws Exception {
		
		//신청 양식 불러오기
//		List<FormDto> formlist = boardService.list();
//
//		model.addAttribute("formlist", formlist);
//		staff_recruitment 테이블로 다시 불러오기
		
		List<StaffBySrnoDto> StaffBySrnoList = staffService.getStaffRecruitmentAndFormList();
		model.addAttribute("StaffBySrnoList", StaffBySrnoList);
		
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
		//해당 축제의 데이터 가져오기
		FormDto formDtoByFno = boardService.read(fno);
		//모델에 추가하여 뷰로 전달
		model.addAttribute("formDtoByFno", formDtoByFno);
		
		//Staff
		//스탭 모집 공고 조회
		StaffDto staffRecruitment = staffService.getStaffRecruitment(fno);
		model.addAttribute("staffRecruitment", staffRecruitment);
		
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

		return "staffRecruitment";
	}
	
	@PostMapping("/staffRecruitment")
	public String staffRecruitment_process (@RequestParam("fno") int fno, 
				  Model model, @ModelAttribute StaffApplyDto staffApplyDto, 
				  @RequestParam("supportPeriodStart") String supportPeriodStart,
			      @RequestParam("supportPeriodEnd") String supportPeriodEnd,
			      BindingResult bindingResult, RedirectAttributes redirectAttributes) {
		
		//날짜가 String이라서 형변환 후 if문으로 비교
	    DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	    
	    try {
	        LocalDate startDate = LocalDate.parse(supportPeriodStart, dateFormatter);
	        LocalDate endDate = LocalDate.parse(supportPeriodEnd, dateFormatter);

	        if (endDate.isBefore(startDate)) {
	        	redirectAttributes.addFlashAttribute("errorDate", "지원기간을 다시 확인해 주세요.");
	            
	            return "redirect:/staffRecruitment?fno=" + fno;
	        }
	        
	        //유효성 검사 통과 시, 스탭 신청 성공
			staffService.staffRecruitmentApply(staffApplyDto);
			redirectAttributes.addFlashAttribute("successApply", "해당 모집 공고에 신청 성공하였습니다.");

	    } catch (ParseException e) {
	        //날짜 형식이 올바르지 않은 경우 예외 처리
	    	redirectAttributes.addFlashAttribute("errorDate", "날짜 형식이 올바르지 않습니다.");
	    	
	        return "redirect:/staffRecruitment?fno=" + fno;
	    }

	    return "redirect:/staffRecruitment?fno=" + fno;
	}

}





