package com.fpp.validator.user;

import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import com.fpp.dto.user.UserDto;

public class UserValidator {

	public static void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub

		UserDto userDto = (UserDto) target;

		// 아이디
		if ((userDto.getLogin_Id().length() < 8) || (userDto.getLogin_Id().length() > 16)
					|| (Pattern.matches("", userDto.getLogin_Id()))) {
			errors.rejectValue("login_Id", "id.error", "아이디 : 8~16자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.");
		}
		// 비번
		if ((userDto.getLogin_Pw().length() < 8) || (userDto.getLogin_Pw().length() > 16)) {
			errors.rejectValue("login_Pw", "pw.error", "비밀번호 : 8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
		}
		// 이름
		if ((userDto.getName().equals(""))) {
			errors.rejectValue("name", "name.error", "이름 : 필수 정보입니다.");
		}
		// 이메일
		if ((userDto.getEmail().equals(""))) {
			errors.rejectValue("email", "email.error", "이메일 : 이메일 주소를 다시 확인해주세요.");
		}
		// 전화번호
		if ((userDto.getTel_Number().equals(""))) {
			errors.rejectValue("tel_Number", "tel_Number.error", "전화번호 : 형식에 맞지 않는 번호입니다.");
		}
		// 생년월일
		if ((userDto.getBirth().equals(""))) {
			errors.rejectValue("birth", "birth.error", "생년월일 : 필수 정보입니다.");
		}

	}

}
