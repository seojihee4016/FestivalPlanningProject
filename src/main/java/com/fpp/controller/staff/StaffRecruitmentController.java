package com.fpp.controller.staff;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.expression.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fpp.dto.board.FormDto;
import com.fpp.dto.commonCode.CommonCodeDto;
import com.fpp.dto.staff.StaffApplyDto;
import com.fpp.dto.staff.StaffApplyListDto;
import com.fpp.dto.staff.StaffFormDto;
import com.fpp.dto.staff.StaffDto;
import com.fpp.service.applicationForm.BoardService;
import com.fpp.service.commonCode.CommonCodeService;
import com.fpp.service.staff.StaffService;

@Controller
public class StaffRecruitmentController {
	
	@Autowired
	StaffService staffService;
	
	@Autowired
	BoardService boardService;
	
	@Autowired
	CommonCodeService commonCodeService;
	
	//스탭 모집 공고 작성 페이지
	@GetMapping("/staffRecruitment_form")
	public String staffRecruitment_form(@RequestParam("fno") int fno, Model model) throws Exception {
		
	    //해당 축제 데이터 가져오기
	    FormDto formDto = boardService.read(fno);
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
	    //StaffDto List 중 SRNO 가져와서 중복 체크하기
		List<StaffDto> staffList = staffService.getStaffRecruitmentList();
	    for (StaffDto staff : staffList) {
	        if (staff.getSRNO() == formDto.getFno()) {
	        	redirectAttributes.addFlashAttribute("errorFno", "이미 업로드된 모집 공고입니다.");
	        	
	        	return "redirect:/staffRecruitment_form?fno=" + fno;
	        }
	    }
	    //모집인원
	    if (staffDto.getRecruitmentTO() == null || staffDto.getRecruitmentTO() <= 0) {
	    	//오류 메시지를 bindingResult에 추가합니다.
	    	//이는 검증 실패 시 해당 오류 메시지가 bindingResult에 저장되어야 한다는 의미입니다.
	        bindingResult.addError(new FieldError("staffDto", "recruitmentTO", " *모집 인원을 입력해 주세요."));
	        //오류 메시지를 redirectAttributes에 추가합니다.
	        //이는 검증 실패 시 해당 오류 메시지를 "리다이렉트"된 페이지로 전달하여 출력하기 위한 것입니다.
	        redirectAttributes.addFlashAttribute("errorRecruitmentTO", " *모집 인원을 입력해 주세요.");
	    }
	    //모집분야
	    if (staffDto.getApplicationPeriod() == null) {
	        bindingResult.addError(new FieldError("staffDto", "applicationPeriod", "접수 기간을 입력해 주세요."));
	        redirectAttributes.addFlashAttribute("errorApplicationPeriod", "접수 기간을 입력해 주세요.");
	    }
	    //검증 실패 시, 다시 입력 폼으로
	    if (bindingResult.hasErrors()) {
	    	redirectAttributes.addFlashAttribute("org.springframework.validation.BindingResult.staffDto", bindingResult);
	        redirectAttributes.addFlashAttribute("staffDto", staffDto);
	        return "redirect:/staffRecruitment_form?fno=" + fno;
	    }
	    
	    //검증 성공 시, 모집 공고 업로드
	    staffService.recruitmentStaff(staffDto);
	    redirectAttributes.addFlashAttribute("successUpload", "모집 공고가 업로드되었습니다.");
    	
	    return "redirect:/staffRecruitment_form?fno=" + fno;
	}
	
	
	//스탭 모집 공고 페이지
	@GetMapping("/staffRecruitmentList")
	public String staffRecruitmentList(Model model) throws Exception {
		
		//오늘 날짜
		LocalDate today = LocalDate.now();
		
		//모집 공고 리스트 가져오기
		List<StaffFormDto> staffFormList = staffService.getStaffRecruitmentAndFormList();
		
		//접수 기간이 지나지 않은 공고들만 필터링하여 리스트에 추가
		List<StaffFormDto> activeStaffFormList = new ArrayList<>();
		for (StaffFormDto staffForm : staffFormList) {
	        LocalDate applicationEndDate = LocalDate.parse(staffForm.getApplicationPeriod());
	        if (!today.isAfter(applicationEndDate)) {
	            activeStaffFormList.add(staffForm);
	        }
	    }
		model.addAttribute("activeStaffFormList", activeStaffFormList);
		
		return "staffRecruitmentList";
	}
	
	//스탭 신청 페이지
	@GetMapping("/staffRecruitment")
	public String staffRecruitment(@RequestParam("fno") int fno, 
			 	  Model model) throws Exception {
		
		//스탭 모집 공고 + 신청 양식 테이블 조회 by fno
		StaffFormDto staffFormListByFno = staffService.getStaffRecruitmentFormListByFno(fno);
		model.addAttribute("staffFormListByFno", staffFormListByFno);
		
		//코드 테이블
		List<CommonCodeDto> commonCodeList = commonCodeService.getCommonCodeList();
		model.addAttribute("commonCodeList", commonCodeList);
		
		return "staffRecruitment";
	}
	
	@PostMapping("/staffRecruitment")
	public String staffRecruitment_process (@RequestParam("fno") int fno, 
				  Model model, @ModelAttribute StaffApplyDto staffApplyDto, 
			      BindingResult bindingResult, RedirectAttributes redirectAttributes,
			      HttpSession session) {
		
		StaffFormDto staffFormListByFno = staffService.getStaffRecruitmentFormListByFno(fno);
		
		//날짜가 String이라서 형변환 후 if문으로 비교
	    DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	    
	    try {
	        LocalDate startDate = LocalDate.parse(staffApplyDto.getSupportPeriodStart(), dateFormatter);
	        LocalDate endDate = LocalDate.parse(staffApplyDto.getSupportPeriodEnd(), dateFormatter);
	        //지원기간
	        if (endDate.isBefore(startDate)) {
	        	redirectAttributes.addFlashAttribute("errorDate", "지원기간을 다시 확인해 주세요.");
	            
	            return "redirect:/staffRecruitment?fno=" + fno;
	        }
	        //지원분야
			if(!staffFormListByFno.getRecruitmentField().equals(staffApplyDto.getRecruitmentField())) {
				redirectAttributes.addFlashAttribute("errorRecruitmentField", "지원할 수 없는 분야입니다.");
				
				return "redirect:/staffRecruitment?fno=" + fno;
			}
			//로그인 상태
			if (session.getAttribute("loginId") == null) {
		        redirectAttributes.addFlashAttribute("errorLogin", "로그인 후 이용 가능합니다.");
		        
		        return "redirect:/staffRecruitment?fno=" + fno;
		    }
	        
	        //유효성 검증 성공 시, 스탭 신청
			staffService.staffRecruitmentApply(staffApplyDto);
			redirectAttributes.addFlashAttribute("successApply", "해당 모집 공고에 신청 성공하였습니다.");

	    } catch (ParseException e) {
	        //날짜 형식이 올바르지 않은 경우 예외 처리
	    	redirectAttributes.addFlashAttribute("errorDate", "날짜 형식이 올바르지 않습니다.");
	    	
	        return "redirect:/staffRecruitment?fno=" + fno;
	    }

	    return "redirect:/staffRecruitment?fno=" + fno;
	}
	
	
	@GetMapping("/staffApplyList")
	public String staffApplyList(Model model) {
		
		List<StaffApplyListDto> staffApplyList = staffService.getStaffApplyList();
		model.addAttribute("staffApplyList", staffApplyList);
		
		return "staffApplyList";
	}

}





