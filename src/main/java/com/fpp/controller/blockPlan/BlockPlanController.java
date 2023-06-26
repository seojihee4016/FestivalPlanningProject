package com.fpp.controller.blockPlan;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BlockPlanController {
	
	@GetMapping("/blockPlan")
	public String blockPlan() {
		return "blockPlan";
	}

}
