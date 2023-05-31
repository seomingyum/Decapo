package kr.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.entity.Coach;
import kr.spring.mapper.CoachMapper;


@Controller
public class CoachController {
	
	@Autowired
	CoachMapper coachMapper;
	
	// 코치매칭 페이지로로 이동
	@RequestMapping("/coach")
	public String main(Model model) {
		List<Coach> list = coachMapper.coachList();
		model.addAttribute("list", list);
		return "coach/coach";
	}
	

	// 코치지역 검색 기능
	@RequestMapping("/regionSerch.do")
	public String coachSerch(@RequestParam("region") String region, Model model) {
		List<Coach> searchList = coachMapper.searchList(region);
		model.addAttribute("list", searchList);
		return "coach/coach";
	}
	
	// 코치지역 모달창 데이터 뿌리기
		@RequestMapping("/coachModal/{coachIdx}")
		@ResponseBody
		public Coach coachModal(@PathVariable("coachIdx") int coachIdx) {
			Coach vo = coachMapper.coachModal(coachIdx);
			return vo;
		}
		
}
