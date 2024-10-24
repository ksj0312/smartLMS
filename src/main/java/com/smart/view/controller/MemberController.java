package com.smart.view.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.smart.lms.service.BoardService;
import com.smart.lms.service.MailSendService;
import com.smart.lms.service.MemberService;
import com.smart.lms.vo.MyPageVO;
import com.smart.lms.vo.ProfessorVO;
import com.smart.lms.vo.StudentVO;


@Controller
public class MemberController {
	
	@Autowired
	private MemberService memService;
	
	@Autowired
	private MailSendService mailService;
	
	@Autowired
	private BoardService boardService;

	
	//로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session, Model model, StudentVO vo , ProfessorVO pvo) throws IOException {
	    session.invalidate();
		return "redirect:/";
	}
	
	//학생 로그인 페이지 이동
	@GetMapping("/student")
		public String studentLoginPage(Model model, HttpServletResponse response) {
			model.addAttribute("state", "STATE_STRING");
			response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
			response.setHeader("Pragma", "no-cache"); 
			response.setDateHeader("Expires", 0); 
		    return "member/studentLogin";  
		}
	
	//관리자(교수) 로그인 페이지 이동
	@GetMapping("/adminpage")
	public String adminLoginPage(Model model, HttpServletResponse response) {
		model.addAttribute("state", "STATE_STRING");
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		response.setHeader("Pragma", "no-cache"); 
		response.setDateHeader("Expires", 0); 
		return "member/adminLogin";  
	}
	
	@GetMapping("/message")
	public String message(HttpSession session) {
		String id = (String)session.getAttribute("userId");
		session.setAttribute("noteCount", boardService.noteCount(id));
		return "redirect:/";
	}
	   
	// 학생 로그인 
	@PostMapping("/student")
		public String studentLogin(StudentVO vo, HttpSession session, HttpServletResponse response) {
			
		      vo = memService.studentLogin(vo);
		    
		      if (vo != null) {
		         response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
		         response.setHeader("Pragma", "no-cache"); 
		         response.setDateHeader("Expires", 0); 
		         String id = memService.getStudent(vo).getId();
		         session.setAttribute("userId", id);
		         session.setAttribute("userName", memService.getStudent(vo).getName());
		         session.setAttribute("userStatus", memService.getStudent(vo).getStatus());
		         session.setAttribute("loginChk", "stu");
		         session.setAttribute("noteCount", boardService.noteCount(id));
		         
		         return "redirect:/";
		         
		      } else {
		         session.setAttribute("userError", "로그인에러");
		         return "member/studentLogin"; 
		      }
		   }
	
	// 관리자(교수) 로그인 
	@PostMapping("/admin")
		public String adminLogin(ProfessorVO vo, Model model, HttpSession session, HttpServletResponse response) {
			
			vo = memService.adminLogin(vo);
				
		      if (vo != null) {
		         response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
		         response.setHeader("Pragma", "no-cache"); 
		         response.setDateHeader("Expires", 0); 
		         
		         session.setAttribute("userId", memService.getAdmin(vo).getId());
		         session.setAttribute("userName", memService.getAdmin(vo).getName());
		         session.setAttribute("userStatus", memService.getAdmin(vo).getStatus());
		         session.setAttribute("userType", memService.getAdmin(vo).getType());
		         session.setAttribute("loginChk", "pro");
		         String id = (String)session.getAttribute("userId");
		         session.setAttribute("noteCount", boardService.noteCount(id));
		         
		         return "redirect:/admin";
		         
		      } else {
		         session.setAttribute("userError", "로그인에러");
		         return "member/adminLogin"; 
		      }
		   }
	
	//관리자(교수) 관리 페이지 이동
	@GetMapping("/admin")
	public String adminPage() {
		return "member/adminPage";  
	}
	
	@GetMapping("/admin/info")
	public String adminMyPageInfo(HttpSession session, Model model) {
		String userId = (String) session.getAttribute("userId");
		model.addAttribute("user", memService.getAdminInfo(userId));
		return "member/adminMyPageInfo";
	}
	
	@GetMapping("/mypage")
	public String myPage(HttpSession session, Model model) {
		String userId = (String) session.getAttribute("userId");
		model.addAttribute("user",memService.getUserInfo(userId));
		return "member/myPageMain";
	}
	
	@GetMapping("/mypage/info")
	public String myPageInfo(HttpSession session, Model model) {
		String userId = (String) session.getAttribute("userId");
		model.addAttribute("user",memService.getUserInfo(userId));
	return "member/myPageInfo";
	}
	
	@GetMapping("/classlist")
	public String getClassList(@RequestParam("Id") String Id, MyPageVO vo, HttpSession session, Model model) {
		vo.setId((String) session.getAttribute("userId"));
		model.addAttribute("classList",memService.getClassList(vo));
		return "member/myPageClass";
	}
	
	@PutMapping("/updateTel")
	@ResponseBody
	public void updateTel(HttpSession session, @RequestBody Map<String, String> data) throws Exception{
	    String tel = data.get("tel");
	    String pasttel = data.get("pasttel");
	    memService.updateTelTx(tel, pasttel);
	    
	    session.invalidate();
	}

	
	@GetMapping("/telCheck")
	@ResponseBody
	public String sendSMS(@RequestParam("tel") String tel) { // 휴대폰 문자보내기
		int code = (int) ((Math.random() * (9999 - 1000 + 1)) + 1000);// 난수 생성

		memService.certifiedPhoneNumber(tel, code);
		return Integer.toString(code);
	}
	//현재비밀번호가 일치하는지
	@PostMapping("/changePwd")
	@ResponseBody
	public boolean changePwd(HttpSession session, StudentVO vo) {
//		String userId = (String) session.getAttribute("userId");
		vo.setId((String) session.getAttribute("userId"));
		boolean result = memService.changePwd(vo);
		return result;
	}
	
	//현재비밀번호가 일치하는지
	@PostMapping("/changeAdminPwd")
	@ResponseBody
	public boolean changeAdminPwd(HttpSession session, ProfessorVO vo) {
//		String userId = (String) session.getAttribute("userId");
		vo.setId((String) session.getAttribute("userId"));
		boolean result = memService.changeAdminPwd(vo);
		return result;
	}
	
	//비밀번호 변경
	@PutMapping("/changeNewPwd")
	@ResponseBody
	public void changeNewPwd(HttpSession session, @RequestBody StudentVO vo)throws Exception {
//		String userId = (String) session.getAttribute("userId");
		vo.setId((String) session.getAttribute("userId"));
	    memService.changeNewPwdTx(vo);
	    
	    session.invalidate();
	}
	
	//이메일인증 	
	@GetMapping("/mailCheck")
	@ResponseBody
	public String mailCheck(@RequestParam String email) {
		return mailService.joinEmail(email);
	}

	@PutMapping("/updateMail")
	@ResponseBody
	public void updateMail(HttpSession session, @RequestBody Map<String, String> requestData) throws Exception {
	    String userId = (String) session.getAttribute("userId");

	    String email = requestData.get("email");


	    memService.updateMailTx(email, userId);
	    
	    session.invalidate();
	}
	
	@PutMapping("/updatePost")
	@ResponseBody
	public void updatePost(HttpSession session, @RequestBody Map<String, String> requestData) throws Exception {
	    String userId = (String) session.getAttribute("userId");

	    String zipcode = requestData.get("zipcode");
	    String addr = requestData.get("addr");
	    String detail_addr = requestData.get("detail_addr");


	    memService.updatePostTx(zipcode, addr, detail_addr, userId);
	    
	    session.invalidate();
	}
	
	@GetMapping("/getId")
	@ResponseBody
	public StudentVO getId(@RequestParam("email") String email) {
		StudentVO vo = memService.getId(email);
		return vo;
	}
	
	@PutMapping("/changeFindNewPwd")
	@ResponseBody
	public void changeFindNewPwd(HttpSession session, @RequestBody StudentVO vo) throws Exception {
	    memService.changeNewPwdTx(vo);
	    
	    session.invalidate();
	}
	
	@GetMapping("/myPageClassInfo")
	@ResponseBody
	public MyPageVO myPageClassInfo(HttpSession session, @RequestParam("c_number") int c_number) {
		String userId = (String) session.getAttribute("userId");
		MyPageVO vo = memService.myPageClassInfo(c_number, userId);
		return vo;
	}
	
}
		
		

