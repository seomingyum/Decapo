package kr.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.bind.annotation.RequestParam;

import kr.spring.entity.Coach;

@Mapper
public interface CoachMapper {
	
	// 코치 리스트 가져오는 기능
	public List<Coach> coachList();

	public List<Coach> searchList(String region);

	public Coach coachModal(int coachIdx);

	
}
