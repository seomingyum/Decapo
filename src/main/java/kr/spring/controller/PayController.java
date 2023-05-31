package kr.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PayController {
	
	// 결제창으로 이동
		@RequestMapping("/pay")
		public String main() {
			return "pay/pay";
		}
}
