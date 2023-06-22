package com.fpp.scheduler;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

import org.apache.logging.log4j.core.config.Scheduled;
import org.json.simple.parser.ParseException;


import com.fasterxml.jackson.databind.ObjectMapper;
import com.fpp.dto.festivalData.FestivalDataDto;
import com.fpp.dto.festivalData.FestivalDataObject;
import com.fpp.dto.festivalData.FestivalDataResponse;

import java.io.BufferedReader;
import java.io.IOException;


public class FestivalInfoUpdate {
    public static void festivalInfoUpdateScheduler() throws IOException, ParseException {
        StringBuilder urlBuilder = new StringBuilder("http://api.data.go.kr/openapi/tn_pubr_public_cltur_fstvl_api"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=nLd%2F0mnnLeO6MJSi8%2Bi69V4wRIKQkqOV5queftFbp5ZBdBW5qcYQDwnX4qPaH97CpuPCHCcau8tIyVnNOdUCuQ%3D%3D"); /*Service Key*/
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
        System.out.println(sb.toString());
        
        String jsonStr = sb.toString();
        
        
        ObjectMapper objectMapper = new ObjectMapper(); 
        FestivalDataObject requestInfo = objectMapper.readValue(jsonStr, FestivalDataObject.class);
		
         
        System.out.println(objectMapper);
		List<FestivalDataDto> itemsInfo = requestInfo.getResponse().getBody().getItems();
		System.out.println(itemsInfo);
		 
		
        
        
    }
}