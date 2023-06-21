package com.fpp.controller.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fpp.dto.user.UserDto;
import com.fpp.service.user.UserService;
import com.fpp.validator.user.UserValidator;

@Controller
public class UserController {

	@Autowired
	UserService userService;
	@Autowired
	UserValidator userValidator;

	@GetMapping("/join")
	public String join(HttpSession session) {

		return "join";
	}

	@PostMapping("/join")
	public String join_process(UserDto userDto, HttpServletResponse response) throws IOException {

		// userDto 안에 사용자가 입력한, id , name 들어있을것이다.
		int result = userService.saveUser(userDto);

		if (result > 0) {
			// 정상 케이스
			return "login";
		} else {
			// 뭔가 문제가 발생했다. -> 유효성 검증 -> 다른 페이지

			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('공란이 있습니다.'); </script>");
			out.flush();
			return "join";
		}

	}

	@GetMapping("/userList")
	public String userList(Model model) {

		UserDto userDto = new UserDto();

		List<UserDto> userList = userService.getUserList2(userDto);

		model.addAttribute("userList", userList);

		return "userList";
	}


	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		binder.addValidators(userValidator);
	}

	@RequestMapping("/")
	public String moveTestJsp(Model model) {
		// 빈 객체 넘겨줘야함.
		model.addAttribute("userDto", new UserDto());
		return "insert";
	}

	@RequestMapping("/insert")
	public String userInsert(@Valid @ModelAttribute UserDto userDto, BindingResult result) {

		System.out.println("---- UserController::userInsert() ----");

		System.out.println(userDto.toString());

		System.out.println("오류가 있나요? : " + result.hasErrors());

		if (result.hasErrors()) {
			// form에 에러가 있으면
			return "insert";
		}
		// 에러가 없으면
		return "";

	}
}
