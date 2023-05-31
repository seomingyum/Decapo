package kr.spring.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.spring.entity.Member;

@Mapper
public interface MemberMapper {

	public Member registerCheck(String memID);

	public int join(Member m);

	public Member login(Member m);

	public int update(Member m);

	public void imageUpload(Member mvo);

	public Member getMember(String memID);

}
