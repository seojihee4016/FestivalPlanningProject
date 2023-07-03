package com.fpp.controller.user;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.validation.BindingResult;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fpp.dto.user.UserDto;
import com.fpp.service.user.UserService;
import com.fpp.utils.ScriptUtil;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Controller
public class UserController {

	@Autowired
	UserService userService;

	@RequestMapping("/")
	public String main() {
		return "main";
	}
	
	@RequestMapping("/main")
	public String mainpage() {
		return "main";
	}

	@GetMapping("/join")
	public String join() {

		return "join";
	}

	@PostMapping("/join")
	public String join_process(@ModelAttribute UserDto userDto, BindingResult bindingResult,
			HttpServletResponse response) throws IOException {

		int result = userService.saveUser(userDto, bindingResult);

		// 유효성 검증 실패
		if (bindingResult.hasErrors() || result == 0) {
			ScriptUtil.alert(response, "회원가입에 실패했습니다.");
			return "join";
		}
		// 회원가입 성공
		return "main";
	}

	@GetMapping("/login")
	public String login() {
		return "login";
	}

	@PostMapping("/login")
	public String login_proc(@ModelAttribute UserDto userDto, HttpSession session){

		System.out.println(userDto.toString());
		boolean tryLogin = userService.login(userDto);

		System.out.println(tryLogin);

		if (tryLogin) {
			session.setAttribute("loginId", userDto.getLoginId());
			return "redirect:/main";
		}
		
		return "redirect:/login";
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login";
	}

	@PostMapping("/idcheck")
	@ResponseBody
	public JsonObject idCheck(@ModelAttribute UserDto userDto, BindingResult bindingResult) {

		JsonParser parser = new JsonParser();
		JsonObject obj = null;

		boolean idCheck = userService.idCheck(userDto, bindingResult);

		if (idCheck) {
			obj = (JsonObject) parser.parse("{\"result\" : \"true\" }");
		} else {
			obj = (JsonObject) parser.parse("{\"result\" : \"false\" }");

		}

		return obj;
	}

	@RequestMapping("/header")
	public String header() {

		return "header";
	}

	@RequestMapping("/agreement")
	public String agreement() {

		return "/agreement";
	}

}
