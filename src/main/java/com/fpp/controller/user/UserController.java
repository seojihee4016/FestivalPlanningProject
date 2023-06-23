package com.fpp.controller.user;

import java.util.List;

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

import com.fpp.dto.user.UserDto;
import com.fpp.service.user.UserService;
import com.fpp.validator.user.UserValidator;

@Controller
public class UserController {

	@Autowired
	UserService userService;

	@GetMapping("/join")
	public String join() {

		return "join";
	}

	@PostMapping("/join")
	public String join_process(@ModelAttribute UserDto userDto, BindingResult bindingResult) {

		int result = userService.saveUser(userDto, bindingResult);
		
		
		// 유효성 검증 실패
		if (bindingResult.hasErrors() || result == 0) {			
			
			return "join";
		}	
			// 회원가입 성공		

			
			return "login";
		
	}

	@GetMapping("/userList")
	public String userList(Model model) {

		UserDto userDto = new UserDto();

		List<UserDto> userList = userService.getUserList2(userDto);

		model.addAttribute("userList", userList);

		return "userList";
	}


}
