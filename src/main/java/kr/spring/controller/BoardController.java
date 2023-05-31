package kr.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class BoardController {
	
	// 메인 페이지 이동
	@RequestMapping("/")
	public String main() {
		return "index";
	}
	
	@RequestMapping("/boardMain.do")
	public String boardMain() {
		return "board/main";
	}
	
	// 메인 페이지 이동
		@RequestMapping("/test")
		public String test() {
			return "test";
		}
}
