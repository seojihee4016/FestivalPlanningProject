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

	@RequestMapping("/main")
	public String main() {
		return "main";
	}

	@GetMapping("/join")
	public String join() {

		return "join";
	}

	@PostMapping("/join")
	public String join_proc(@ModelAttribute UserDto userDto, BindingResult bindingResult, HttpServletResponse response)
			throws IOException {

		int result = userService.saveUser(userDto, bindingResult);

		// 유효성 검증 실패
		if (bindingResult.hasErrors() || result == 0) {
			ScriptUtil.alert(response, "회원가입에 실패했습니다.");
			return "join";
		}
		// 회원가입 성공
		ScriptUtil.alert(response, "Piñata의 회원이 되신 것을 환영합니다!");
		return "main";
	}

	@GetMapping("/login")
	public String login() {
		return "login";
	}

	@PostMapping("/login")
	public String login_proc(@ModelAttribute UserDto userDto, HttpSession session) {

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
		return "redirect:/main";
	}
	
	@RequestMapping("/logout2")
	public String logout2(HttpSession session) {
		session.invalidate();
		return "logout2";
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

	@GetMapping("/userupdate")
	public String userupdate() {

		return "userupdate";
	}

	@PostMapping("/userupdate")
	public String userupdate_proc(@ModelAttribute UserDto userDto, BindingResult bindingResult,
			HttpServletResponse response, HttpSession session) throws IOException {

		userDto.setLoginId(session.getAttribute("loginId").toString());
		int result = userService.editUserInfo(userDto, bindingResult);

		// 유효성 검증 실패
		if (bindingResult.hasErrors() || result == 0) {
			ScriptUtil.alert(response, "회원정보 수정을 실패했습니다.");
			return "userupdate";
		}
		// 회원정보 수정성공
		ScriptUtil.alert(response, "회원정보 수정을 완료했습니다.");
		return "main";
	}

	@RequestMapping("/footer")
	public String footer() {

		return "footer";
	}

	@GetMapping("/pwcheck")
	public String pwcheck() {
		return "pwcheck";
	}

	@PostMapping("/pwcheck")
	public String pwcheck_proc(@ModelAttribute UserDto userDto, HttpSession session) {

		userDto.setLoginId(session.getAttribute("loginId").toString());
		System.out.println(userDto.toString());
		boolean tryPwCheck = userService.pwCheck(userDto);

		System.out.println(tryPwCheck);

		if (tryPwCheck) {
			session.setAttribute("loginPw", userDto.getLoginPw());
			return "redirect:/userupdate";
		}

		return "redirect:/pwcheck";
	}

	@GetMapping("/withdrawal")
	public String withdrawal() {
		return "withdrawal";
	}

	@PostMapping("/withdrawal")
	public String withdrawal_proc(@ModelAttribute UserDto userDto, HttpSession session, HttpServletResponse response) throws IOException {

		userDto.setLoginId(session.getAttribute("loginId").toString());
		int result = userService.WithdrawalUserInfo(userDto);

		if (result == 0) {
			ScriptUtil.alert(response, "입력하신 비밀번호가 일치하지 않습니다.");
			return "withdrawal";
		}
		// 회원탈퇴 성공
		ScriptUtil.alert(response, "그동안 Piñata를 이용해주셔서 감사합니다.");
		return "logout2";
	}
}
