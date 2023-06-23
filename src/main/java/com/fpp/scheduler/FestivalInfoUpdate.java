package com.fpp.scheduler;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fpp.dao.festivalDataDao.FestivalDataDao;
import com.fpp.dao.festivalDataDao.impl.FestivalDataDaoImpl;
import com.fpp.dto.festivalData.FestivalDataDto;

import java.io.IOException;


public class FestivalInfoUpdate {
	
	@Autowired
	FestivalDataDao festivalDataDao;
	
	//@Scheduled(cron = "1 * * * * *")
	public void festivalInfoUpdateScheduler() throws IOException, ParseException {
		
		FestivalDataDto item = new FestivalDataDto();
    	item.setFstvlNm( "String fstvlNm");
		item.setOpar("String opar");
		item.setFstvlStartDate( "String fstvlStartDate");
		item.setFstvlEndDate( "	String fstvlEndDate");
		item.setFstvlCo( "String fstvlCo");
		item.setPhoneNumber( "String phoneNumber");
		item.setHomepageUrl( "String homepageUrl");
		item.setRdnmadr( "String rdnmadr");
		item.setMnnst( "String mnnst");
		item.setAuspcInstt( "String auspcInstt");
		item.setSuprtInstt("String suprtInstt");
		item.setRelateInfo( "String relateInfo");
		item.setLnmadr( "String lnmadr");
		item.setLatitude( "String latitude");
		item.setLongitude("String longitude");
		item.setReferenceDate( "String referenceDate");
		item.setInsttCode( "String insttCode");
		
		festivalDataDao.festivalDataApiSave(item);
		
	}
}