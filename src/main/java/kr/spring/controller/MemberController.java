package kr.spring.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.spring.entity.Member;
import kr.spring.mapper.MemberMapper;

@Controller
public class MemberController {
	
	@Autowired
	private MemberMapper memberMapper;
	
	// 회원프로필 사진 등록 기능 요청
	@RequestMapping("/imageUpload.do")
	public String imageUpload(HttpServletRequest request, RedirectAttributes rttr, HttpSession session) throws IOException {
		// 파일 업로드new 
		MultipartRequest multi = null;
		
		int fileMaxSize = 100*1024*1024; // 파일최대크기 - 100MB
		String savePath = request.getRealPath("resources/upload"); // 파일이 저장될 위치 경로
		String encType = "UTF-8"; // 인코딩 타입
		DefaultFileRenamePolicy dfrp = new DefaultFileRenamePolicy();
		
		multi = new MultipartRequest(request, savePath, fileMaxSize, encType, dfrp); // 요청데이터, 저장경로, 최대크기, 인코딩, 파일명중복제거 
		
		String newProfile="";
		
		File file =multi.getFile("memProfile");
		
		if(file != null) {
			// 사용자가 파일을 올렸을떄
			String ext = file.getName();
			System.out.println(ext);
			
			//.뒤에 있는 확장자만 가져오기
			ext = ext.substring(ext.lastIndexOf(".")+1);
			System.out.println(ext);
			
			// .뒤에 확장자를 대문자로 다 바꾸기
			ext = ext.toUpperCase();
			System.out.println(ext);
			
			boolean isCheck = ext.equals("PNG") || ext.equals("JPG") || ext.equals("GIF");
			
			if(!isCheck) {
				// 이미지파일이 아닐때
				if(file.exists()) { // 현재 해당파일이 존재하는지 알려주는 메소드
					file.delete();
				}
				
				rttr.addFlashAttribute("msgType", "실패 메세지");
				rttr.addFlashAttribute("msg", "이미지 파일만 가능합니다.(PNG, JPG, GIF)");
				return "redirect:/imageForm.do";
			} else {
				// 이미지파일일떄
				newProfile = file.getName();
				String memID = multi.getParameter("memID");
				
				String oldImg = memberMapper.getMember(memID).getMemProfile();
				File oldFile = new File(savePath+"/"+oldImg);
				if(oldFile.exists()) {
					oldFile.delete();
				}
				
				
				
				
				
				
//				System.out.println(memID);
//				System.out.println(newProfile);
				
				Member mvo = new Member();
				mvo.setMemProfile(newProfile);
				mvo.setMemID(memID);
				
				
				
				
				//회원의 프로필 이름 저장
				memberMapper.imageUpload(mvo);
				
				//수정하고 나서 회원의 정보를 다시 가져오기
				Member m = memberMapper.getMember(memID);
				session.setAttribute("mvo", m);
				
				
				
				rttr.addFlashAttribute("msgType", "성공 메세지");
				rttr.addFlashAttribute("msg", "프로필이 변경 됐습니다.(PNG, JPG, GIF)");
				return "redirect:/";
			}
		} else {
			rttr.addFlashAttribute("msgType", "실패 메세지");
			rttr.addFlashAttribute("msg", "반드시 이미지를 업로드해주세요.(PNG, JPG, GIF)");
			return "redirect:/imageForm.do";
		}
	}
	
	// 회원프로필 사진 등록페이지 이동 요청
	@RequestMapping("/imageForm.do")
	public String imageForm() {
		
		return "member/imageForm";
	}
	
	// 회원 수정 기능 요청
	@RequestMapping("/update.do")
	public String update(Member m, HttpSession session, RedirectAttributes rttr) {
		
		m.setMemProfile("");
		int cnt = memberMapper.update(m);
		
		if(cnt == 1) {
			session.setAttribute("mvo", m); // 세션값 똑같은 키값으로 해주면 덮어쓰여진다!
			rttr.addFlashAttribute("msgType", "성공 메세지");
			rttr.addFlashAttribute("msg", "회원정보 수정되었습니다.");
			return "redirect:/";
		} else {
			
			return "member/updateForm";
		}
		
//		memberMapper.update(m);
//		session.removeAttribute("mvo");
//		session.setAttribute("mvo", m);
//		return "redirect:/";
		
	}
	
	// 회원정보 수정 페이지 이동
	@RequestMapping("/updateForm.do")
	public String updateForm() {
		return "member/updateForm";
	}
	
	// 로그아웃 기능 요청 URL
	@RequestMapping("/logout.do")
	public String logout(HttpSession session, RedirectAttributes rttr) {
		//session.invalidate();
		session.removeAttribute("mvo");
		rttr.addFlashAttribute("msgType", "성공 메세지");
		rttr.addFlashAttribute("msg", "안전하게 로그아웃 되었습니다.");
		return "redirect:/";
	}
	
	// 로그인 기능 요청 URL
	@RequestMapping("/login.do")
	public String login(Member m, HttpSession session, RedirectAttributes rttr) {
		Member mvo = memberMapper.login(m);
		
		if(mvo == null) {
			rttr.addFlashAttribute("msgType", "실패 메세지");
			rttr.addFlashAttribute("msg", "아이디와 비밀번호를 확인해주세요.");
			return "redirect:/loginForm.do";
		} else {
			rttr.addFlashAttribute("msgType", "성공 메세지");
			rttr.addFlashAttribute("msg", mvo.getMemName()+"님 환영합니다.");
			session.setAttribute("mvo", mvo);
			return "redirect:/";
		}
	}
	
	// 로그인 페에지 이동 요청 URL
	@RequestMapping("/loginForm.do")
	public String loginForm() {
		return "member/loginForm";
	}
	
	
	// 회원가입 기능 요청 URL
	@RequestMapping("/join.do")
	public String join(Member m, RedirectAttributes rttr) {
		
		m.setMemProfile("");
		
		int cnt = 0;
		try {
			cnt = memberMapper.join(m);
		} catch (Exception e) {
			rttr.addFlashAttribute("msgType", "실패 메세지");
			rttr.addFlashAttribute("msg", "회원가입에 실패했습니다.");
			return "redirect:/joinForm.do";
		} finally {
			if(cnt==1) {
				// 회원가입 성공
				rttr.addFlashAttribute("msgType", "성공 메세지");
				rttr.addFlashAttribute("msg", "회원가입에 성공했습니다.");
				return "redirect:/";
			} 
		}
		return null;
	}

	
	
	// 아이디 중복체크 기능 요청
	 @RequestMapping("/registerCheck.do")
	 public @ResponseBody int registerCheck(@RequestParam("memID") String memID) { 
		 Member vo = memberMapper.registerCheck(memID);
		 if(vo != null || memID.equals("")) {
			 return 0;
		 } else {
			 return 1;
		 }
	 }

	
	// 회원가입 페이지 이동 요청
	@RequestMapping("/joinForm.do")
	public String joinForm() {
		return "member/joinForm";
	}
	
	
}
