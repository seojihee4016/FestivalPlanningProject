package com.fpp.controller.applicationForm;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fpp.service.applicationForm.BoardService;
import com.fpp.dto.board.FormDto;
import com.fpp.dto.bulletinBoard.BulletinBoardDto;
import com.fpp.dto.bulletinBoard.PageMaker;
import com.fpp.dto.bulletinBoard.SearchCriteria;
import com.fpp.dto.user.UserDto;

@Controller
public class BoardController {

	@Autowired
	BoardService boardService;

	/*신청 양식 작성*/
	//localhost:8080/applicationForm
	@RequestMapping("/applicationForm")  
	public String applicationForm(@ModelAttribute UserDto userDto, HttpSession session, BulletinBoardDto bulletinBoardDto , Model model) {
		// 세션에서 사용자아이디를 가져옴
		String writer = (String)session.getAttribute("loginId");
		model.addAttribute("writer" ,writer);
		return "applicationForm";
	}

	// 신청 양식 작성
	@RequestMapping(value = "/applicationForm", method = RequestMethod.POST)
	public String write(FormDto formDto) throws Exception{
		boardService.write(formDto);
		return "redirect:/list";
	}

	// 신청 양식 목록 조회 
	@GetMapping("/list")
	public String list(HttpSession session, Model model , @ModelAttribute("scri") SearchCriteria scri) throws Exception{
		
		
		if(session != null) {
			String writer = (String)session.getAttribute("loginId");
			if(writer != null) {
				scri.setLoginId(writer);
			}
		}
		
		model.addAttribute("list",boardService.list(scri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(boardService.listCount(scri));
		model.addAttribute("pageMaker", pageMaker);
		return "list";
	}
	

//	// 신청 양식 수정뷰로 이동 - 화면 연결
//	@GetMapping("/updateView")
//	public String updateView(@Validated FormDto formDto, Model model,  BindingResult bindingResult , @ModelAttribute("scri") SearchCriteria scri) throws Exception{
//		/*formDto.getFno();를 가져오는데 fno < 0인 경우 유효성 검사 추가
//		http://localhost:8080/updateView로 들어가는 경우에는 list 로 이동
//		  int fno = formDto.getFno();
//		    if (fno < 0 || fno = ) {
//		        return "list";
//		    }
//		 */
//		formDto.getFno();
//		System.out.println("formDto.getFno() = " + formDto.getFno()+" "+bindingResult.hasErrors());
//		if (bindingResult.hasErrors()) {
//			System.out.println("bindingResult = " + bindingResult.getAllErrors());
//			return "valid :: #form";
//		}
//		model.addAttribute("update", boardService.read(formDto.getFno()));
//		model.addAttribute("scri", scri);
//		//model.addAttribute("read", boardService.read(formDto.getFno()));
//
//		return "updateView";
//	}
//	
//
//	// 신청 양식 수정 이후 list로 이동
//	@PostMapping("/updateView")
//	public String update(FormDto formDto , @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception{
//		boardService.update(formDto);
//
//		//페이징 유지
//		rttr.addAttribute("page", scri.getPage());
//		rttr.addAttribute("perPageNum", scri.getPerPageNum());
//		rttr.addAttribute("searchType", scri.getSearchType());
//		rttr.addAttribute("keyword", scri.getKeyword());
//
//		return "redirect:/list";
//	}
//
//	// 신청 양식 삭제
//	@PostMapping("/delete")
//	public String delete(FormDto formDto , @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception{
//		boardService.delete(formDto.getFno());
//
//		rttr.addFlashAttribute("scri", scri);
//
//		rttr.addAttribute("page", scri.getPage());
//		rttr.addAttribute("perPageNum", scri.getPerPageNum());
//		rttr.addAttribute("searchType", scri.getSearchType());
//		rttr.addAttribute("keyword", scri.getKeyword());
//		return "redirect:/list";
//	}

}





