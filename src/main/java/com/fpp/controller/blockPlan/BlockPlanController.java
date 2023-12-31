package com.fpp.controller.blockPlan;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.PageLoadStrategy;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

@Controller
public class BlockPlanController {

//	 private WebDriver driver; // WebDriver 인스턴스를 멤버 변수로 선언

	@GetMapping("/blockPlanCapture")
	public String blockPlanCapture(@RequestParam(required = false) String strGeoJson, Model model) {

		strGeoJson = URLDecoder.decode(strGeoJson, Charset.forName("UTF-8"));
		System.out.println(strGeoJson);
//        }
		model.addAttribute("strGeoJson", strGeoJson.trim());

		return "blockPlanCapture";
	}

	@GetMapping("/blockPlan")
	public String blockPlan() {

		return "blockPlan";
	}

	@PostMapping("/captureScreenshot")
	@ResponseBody
	public String captureScreenshot(@RequestBody String strGeoJson) throws InterruptedException {
		System.setProperty("webdriver.chrome.driver", "D:/chromedriver_win32/chromedriver.exe");

		WebDriver driver = null;
		ChromeOptions options = new ChromeOptions();
		options.setPageLoadStrategy(PageLoadStrategy.NORMAL);

		// 브라우저 보이지 않기
		options.addArguments("headless");
//        WebElement elMap = null;
		// 기존 창이 없는 경우에만 WebDriver 인스턴스 생성
		if (driver == null) {
			driver = new ChromeDriver(options);

			driver.navigate().to("http://localhost:8080/blockPlanCapture?strGeoJson="
					+ URLEncoder.encode(strGeoJson.trim(), Charset.forName("UTF-8")));
			// driver.navigate().to("https://www.naver.com");
		} else {
			// 기존 창으로 포커스 전환
			driver.switchTo().window(driver.getWindowHandles().iterator().next());
		}

		JavascriptExecutor js = (JavascriptExecutor) driver;
		for (int i = 0; i < 25; i++) {
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
			}
			// To check page ready state.
			if (js.executeScript("return document.readyState").toString().equals("complete")) {
				break;
			}
		}

		// 스크린샷 캡처
		File screenshotFile = ((TakesScreenshot) driver).getScreenshotAs(OutputType.FILE);

		// 캡처한 이미지를 원하는 경로로 저장
		String destinationPath = "C:/mapsScreenshot/screenshot.png";

		try {
			File destinationFile = new File(destinationPath);
			Files.copy(screenshotFile.toPath(), destinationFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
			System.out.println("스크린샷이 저장되었습니다: " + destinationPath);
		} catch (IOException e) {
			System.out.println("스크린샷 저장 중 오류가 발생했습니다.");
			e.printStackTrace();
		} finally {
			driver.close();
			driver.quit();
		}

		return "success";
	}

}
