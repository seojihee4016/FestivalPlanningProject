package com.fpp.dto.festivalData;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;

@Data
@JsonIgnoreProperties(ignoreUnknown =true)
public class FestivalDataHeader {
	
	String resultCode;
	
}
