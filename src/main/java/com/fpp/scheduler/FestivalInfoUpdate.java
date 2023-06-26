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
import com.fpp.dao.festivalData.FestivalDataDao;
import com.fpp.dao.festivalData.impl.FestivalDataDaoImpl;
import com.fpp.dto.festivalData.FestivalDataDto;
import com.fpp.dto.festivalData.FestivalDataObject;

import java.io.BufferedReader;
import java.io.IOException;

@Component
public class FestivalInfoUpdate {
	
	@Autowired
	FestivalDataDao festivalDataDao;
	
	//@Scheduled(cron = "0/10 * * * * *")
	public void festivalInfoUpdateScheduler() throws IOException, ParseException {
		 
		StringBuilder urlBuilder = new StringBuilder("http://api.data.go.kr/openapi/tn_pubr_public_cltur_fstvl_api"); /*URL*/
		urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=nLd%2F0mnnLeO6MJSi8%2Bi69V4wRIKQkqOV5queftFbp5ZBdBW5qcYQDwnX4qPaH97CpuPCHCcau8tIyVnNOdUCuQ%3D%3D"); /*Service Key*/
		urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지 번호*/
		urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("3000", "UTF-8")); /*한 페이지 결과 수*/
		urlBuilder.append("&" + URLEncoder.encode("type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*XML/JSON 여부*/
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();

		String jsonStr = sb.toString();

		ObjectMapper objectMapper = new ObjectMapper(); 
		FestivalDataObject requestInfo = objectMapper.readValue(jsonStr, FestivalDataObject.class);
		
		if (requestInfo.getResponse().getBody()==null) {
			System.out.println("null");
       	return;
		} else {
			List<FestivalDataDto> itemsInfo = requestInfo.getResponse().getBody().getItems();
			for (FestivalDataDto item : itemsInfo) {
				festivalDataDao.festivalDataApiSave(item);
			}
			
		}

	}
	
}