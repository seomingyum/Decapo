package kr.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TrainLogController {
	
	// 훈련일지 페이지로로 이동
		@RequestMapping("/trainLog")
		public String main() {
			return "trainLog/trainLog";
		}
}
