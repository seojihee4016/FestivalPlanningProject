package com.fpp.dto.festivalData;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;

@Data
@JsonIgnoreProperties(ignoreUnknown =true)
public class FestivalDataBody {
	
	List<FestivalDataDto> items;


}
