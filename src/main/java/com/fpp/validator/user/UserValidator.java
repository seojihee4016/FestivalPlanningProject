package com.fpp.validator.user;

import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import com.fpp.dto.user.UserDto;

public class UserValidator {
	static String ID_REG = "^(?=.*[a-zA-Z])(?=.*\\d)[a-zA-Z\\d_-]{8,16}$";	// id 정규식 {8, 16}글자수
	static String PW_REG = "^.*(?=^.{8,16}$)(?=.*\\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$"; // pw 정규식 {8, 16}글자수
	static String NAME_REG = "^[가-힣]{2,}$"; // name 정규식 {2,}글자수
	static String EMAIL_REG = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$"; // email 정규식 
	static String TEL_REG = "^\\d{3}-\\d{3,4}-\\d{4}$"; // tel-Number 정규식 000- 000, 0000 -0000 패턴 
	static String BIRTH_REG = "^(\\d{4})-(\\d{2})-(\\d{2})$"; // birth 정규식 {4, 2, 2}글자수 ex)1998-04-19

	public static void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub

		UserDto userDto = (UserDto) target;

		// 아이디
		if (!(Pattern.matches(ID_REG, userDto.getLoginId()))) {
			errors.rejectValue("loginId", "id.error", "아이디 : 8~16자의 영문 대 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.");
		}
		// 비번
		if (!(Pattern.matches(PW_REG, userDto.getLoginPw()))) {
			errors.rejectValue("loginPw", "pw.error", "비밀번호 : 8~16자의 영문 대 소문자, 숫자, 특수문자를 조합하여 사용하세요.");
		}
		// 이름
		if (!(Pattern.matches(NAME_REG, userDto.getName()))) {
			errors.rejectValue("name", "name.error", "이름 : 필수 정보입니다.");
		}
		// 이메일
		if (!(Pattern.matches(EMAIL_REG, userDto.getEmail()))) {
			errors.rejectValue("email", "email.error", "이메일 : 이메일 주소를 다시 확인해주세요.");
		}
		// 전화번호
		if (!(Pattern.matches(TEL_REG, userDto.getTelNumber()))) {
			errors.rejectValue("telNumber", "telNumber.error", "전화번호 : 형식에 맞지 않는 번호입니다. (000-0000-0000 형식)");
		}
		// 생년월일
		if (!(Pattern.matches(BIRTH_REG, userDto.getBirth()))) {
			errors.rejectValue("birth", "birth.error", "생년월일 : 형식에 맞지 않는 생년월일입니다. (YYYY-MM-DD 형식)");
		}

	}
	
	public static void idValidate(Object target, Errors errors) {
		
		UserDto userDto = (UserDto) target;

		// 아이디
		if (!(Pattern.matches(ID_REG, userDto.getLoginId()))) {
			errors.rejectValue("loginId", "id.error", "아이디 : 8~16자의 영문 대 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.");
		}
	
	}

}
