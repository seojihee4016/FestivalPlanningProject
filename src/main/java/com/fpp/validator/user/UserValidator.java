package com.fpp.validator.user;

import java.util.regex.Pattern;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;

import org.springframework.validation.Validator;

import com.fpp.dto.user.UserDto;

@Component
public class UserValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {

		return UserDto.class.equals(clazz);
	}

	@Override
	public void validate(Object obj, Errors errors) {

//		ValidationUtils.rejectIfEmpty(errors, "login_Id", "user.login_Id.empty", "아이디를 입력해주세요");
//		ValidationUtils.rejectIfEmpty(errors, "login_Pw", "user.login_Pw.empty", "비밀번호를 입력해주세요");
//		ValidationUtils.rejectIfEmpty(errors, "name", "user.name.empty", "이름을 입력해주세요");
//		ValidationUtils.rejectIfEmpty(errors, "email", "user.email.empty", "이메일을 입력해주세요");
//		ValidationUtils.rejectIfEmpty(errors, "phone_Number", "user.phone_Number.empty", "연락처를 입력해주세요");
//		

		UserDto userDto = (UserDto) obj;

		Pattern pattern = Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$",
                Pattern.CASE_INSENSITIVE);
          if (!(pattern.matcher(userDto.getLogin_Id()).matches())) {
        	  errors.rejectValue("login_Id", "user.email.invalid");
          }
	}

}
