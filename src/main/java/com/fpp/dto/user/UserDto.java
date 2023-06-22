package com.fpp.dto.user;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.PositiveOrZero;
import javax.validation.constraints.Size;

import lombok.Data;

@Data
public class UserDto {

	@NotBlank
	@Size(min = 8, max = 16)
	String login_Id;
	
	@NotBlank
	String login_Pw;
	
	@NotBlank
	String name;
	
	@NotBlank
	@Email
	String email;
	
	@NotBlank
	@PositiveOrZero
	String phone_Number;

}
