package com.fpp.dto.festivalData;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;

@Data
@JsonIgnoreProperties(ignoreUnknown =true)
public class FestivalDataDto {
	
	String ftCode;
    String fstvlNm;
	String opar;
	String fstvlStartDate;
	String fstvlEndDate;
	String fstvlCo;
	String phoneNumber;
	String homepageUrl;
	String rdnmadr;
	String mnnst;
	String auspcInstt;
	String suprtInstt;
	String relateInfo;
	String lnmadr;
	String latitude;
	String longitude;
	String referenceDate;
	String insttCode;
	String imgHref;

}
