package kr.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PostureController {

	// 자세진단 페이지로로 이동
	@RequestMapping("/posture")
	public String main() {
		return "/posture/posture";
	}
}
