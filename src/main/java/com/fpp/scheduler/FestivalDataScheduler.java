package com.fpp.scheduler;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import com.fasterxml.jackson.databind.type.TypeFactory;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fpp.dao.festivalDataDao.impl.FestivalDataDaoImpl;
import com.fpp.dto.festivalData.FestivalDataDto;

public class FestivalDataScheduler{
	@Autowired
	FestivalDataDaoImpl festivalDataDaoImpl;
	
	public void festivalDataSave() throws IOException {

		StringBuilder urlBuilder = new StringBuilder("http://api.data.go.kr/openapi/tn_pubr_public_cltur_fstvl_api"); /*URL*/
	    urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=nLd%2F0mnnLeO6MJSi8%2Bi69V4wRIKQkqOV5queftFbp5ZBdBW5qcYQDwnX4qPaH97CpuPCHCcau8tIyVnNOdUCuQ%3D%3D"); /*Service Key*/
	    urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지 번호*/
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
        
	    ObjectMapper objectMapper = new ObjectMapper(); 
	    List<FestivalDataDto> arrList = Arrays.asList(objectMapper.readValue(sb.toString(), FestivalDataDto[].class));
	   
	   //TypeFactory typeFactory = ObjectMapper.getTypeFactory();
	   //List<FestivalDataDto> festivalDataList = ObjectMapper.readValue(rd.toString(), typeFactory.constructCollectionType(List.class, FestivalDataDto.class));
	   
	  
	  
	   
	   // festivalDataDaoImpl.festivalDataApiSave(requestInfo);
	    	
		
	    
	}
	
	
}
