package com.fpp.controller.myPage;

import java.util.List;

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

import com.fpp.dto.board.FormDto;
import com.fpp.dto.bulletinBoard.BulletinBoardDto;
import com.fpp.dto.bulletinBoard.CommentsDto;
import com.fpp.dto.bulletinBoard.PageMaker;
import com.fpp.dto.bulletinBoard.SearchCriteria;
import com.fpp.dto.user.UserDto;
import com.fpp.service.applicationForm.BoardService;
import com.fpp.service.bulletinBoard.BulletinBoardService;
import com.fpp.service.bulletinBoard.CommentsService;
import com.fpp.service.user.UserService;

@Controller
public class myPageController {
	@Autowired
	BoardService boardService;
	
	@Autowired
	BulletinBoardService bulletinBoardService;

	@Autowired
	CommentsService commentsService;

	@Autowired
	UserService userService;


	/**신청 양식*/
	// 신청 양식 목록 조회 
	@GetMapping("/myApplicationList")
	public String myApplicationList(Model model , @ModelAttribute("scri") SearchCriteria scri) throws Exception{
		model.addAttribute("list",boardService.list(scri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(boardService.listCount(scri));
		model.addAttribute("pageMaker", pageMaker);
		return "myApplicationList";
	}


	// 신청 양식 수정뷰로 이동 - 화면 연결
	@GetMapping("/updateView")
	public String updateView(@Validated FormDto formDto, Model model,  BindingResult bindingResult , @ModelAttribute("scri") SearchCriteria scri) throws Exception{
		/*formDto.getFno();를 가져오는데 fno < 0인 경우 유효성 검사 추가
		http://localhost:8080/updateView로 들어가는 경우에는 list 로 이동
		  int fno = formDto.getFno();
		    if (fno < 0 || fno = ) {
		        return "list";
		    }
		 */
		formDto.getFno();
		System.out.println("formDto.getFno() = " + formDto.getFno()+" "+bindingResult.hasErrors());
		if (bindingResult.hasErrors()) {
			System.out.println("bindingResult = " + bindingResult.getAllErrors());
			return "valid :: #form";
		}
		model.addAttribute("update", boardService.read(formDto.getFno()));
		model.addAttribute("scri", scri);
		//model.addAttribute("read", boardService.read(formDto.getFno()));

		return "updateView";
	}


	// 신청 양식 수정 이후 list로 이동
	@PostMapping("/updateView")
	public String update(FormDto formDto , @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception{
		boardService.update(formDto);

		//페이징 유지
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());

		return "redirect:/myApplicationList";
	}

	// 신청 양식 삭제
	@PostMapping("/delete")
	public String delete(FormDto formDto , @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception{
		boardService.delete(formDto.getFno());

		rttr.addFlashAttribute("scri", scri);

		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		return "redirect:/myApplicationList";
	}


	/**게시판*/

	//게시판 글 리스트 페이지 - 페이지 네이션 추가
		@GetMapping("/myBulletinBoardList")
		public String myBulletinBoardList(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception{

			model.addAttribute("selectBulletinBoardList", bulletinBoardService.selectBulletinBoardList(scri));

			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(scri);
			pageMaker.setTotalCount(bulletinBoardService.listCount(scri));



			model.addAttribute("pageMaker", pageMaker);
			return "myBulletinBoardList";	
		}

		//게시글 수정
		@GetMapping("/bulletinBoardProcess")
		public String bulletinBoardProcess(BulletinBoardDto bulletinBoardDto ,UserDto userDto ,CommentsDto commentsDto, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{

			model.addAttribute("updateBulletinBoard", bulletinBoardService.selectBulletinBoardListByBno(bulletinBoardDto.getBno()));
			model.addAttribute("scri", scri);



			//댓글 - commentsService 주입
			List<CommentsDto> commentList = commentsService.readCommentsList(bulletinBoardDto.getBno());
			model.addAttribute("commentList", commentList);


			return "bulletinBoardProcess";
		}

		// 게시글 수정 이후 리스트로 이동 - 페이징 유지 기능 추가
		@PostMapping("/bulletinBoardProcess")
		public String update(BulletinBoardDto bulletinBoardDto, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception{

			//게시글 수정
			bulletinBoardService.updateBulletinBoard(bulletinBoardDto);

			//페이징 유지
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());

			return "redirect:/myBulletinBoardList";
		}	

		// 게시글 삭제
		@PostMapping("/deleteBulletinBoardByBno")
		public String deleteBulletinBoard(BulletinBoardDto bulletinBoardDto, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception{

			bulletinBoardService.deleteBulletinBoardByBno(bulletinBoardDto.getBno());

			rttr.addFlashAttribute("scri", scri);

			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());

			return "redirect:/myBulletinBoardList";
		}


		/*댓글 작성
		CommentsDto는 댓글 작성하기위한 데이터, 
		SearchCriteria는 bulletinBoardProcess에 있던 page, perPageNum, searchType, keyword값을 받아오는 용도
		RedirectAttributes는 redirect했을때 값들을 가지고 이동
		SearchCriteria의 값을 넣어서 댓글을 저장 한 뒤 원래 페이지로 redirect하여 이동하는 구조*/

		@PostMapping("/writeComments")
		public String writeReply(CommentsDto commentsDto, SearchCriteria scri, RedirectAttributes rttr) throws Exception {

			commentsService.writeComments(commentsDto);

			rttr.addAttribute("bno", commentsDto.getBno());
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());

			return "redirect:/bulletinBoardProcess";
		}

		//댓글 수정 get
		@GetMapping("/updateCommentsByCno")
		public String updateCommentsByCno(CommentsDto commentsDto, SearchCriteria scri, Model model) throws Exception {

			model.addAttribute("updateCommentsByCno", commentsService.selectReply(commentsDto.getCno()));
			model.addAttribute("scri", scri);

			return "bulletinBoardProcess";
		}

		//댓글 수정 post
		@PostMapping("/updateCommentsByCno")
		public String replyUpdate(CommentsDto commentsDto, SearchCriteria scri, RedirectAttributes rttr) throws Exception {

			commentsService.updateCommentsByCno(commentsDto);

			rttr.addAttribute("bno", commentsDto.getBno());
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());

			return "redirect:/bulletinBoardProcess";
		}


		//댓글 삭제 GET
		@GetMapping("/deleteReply")
		public String deleteReply(CommentsDto commentsDto, SearchCriteria scri, Model model) throws Exception {

			model.addAttribute("deleteReply", commentsService.selectReply(commentsDto.getCno()));
			model.addAttribute("scri", scri);

			return "bulletinBoardProcess";
		}

		//댓글 삭제
		@PostMapping("/deleteReply")
		public String replyDelete(CommentsDto commentsDto, SearchCriteria scri, RedirectAttributes rttr) throws Exception {

			commentsService.deleteReply(commentsDto);

			rttr.addAttribute("bno", commentsDto.getBno());
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());

			return "redirect:/bulletinBoardProcess";
		}





	}







