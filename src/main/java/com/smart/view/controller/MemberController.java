package com.smart.view.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.smart.lms.service.MemberService;
import com.smart.lms.vo.ProfessorVO;
import com.smart.lms.vo.StudentVO;


@Controller
public class MemberController {
	
	@Autowired
	private MemberService memService;
	
	//로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session, Model model, StudentVO vo , ProfessorVO pvo) throws IOException {
	    session.invalidate();
		return "redirect:/";
	}
	
	//학생 로그인 페이지 이동
	@GetMapping("/studentLoginPage")
		public String studentLoginPage(Model model, HttpServletResponse response) {
			model.addAttribute("state", "STATE_STRING");
			response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
			response.setHeader("Pragma", "no-cache"); 
			response.setDateHeader("Expires", 0); 
		    return "member/studentLogin";  
		}
	
	//관리자(교수) 로그인 페이지 이동
	@GetMapping("/adminLoginPage")
	public String adminLoginPage(Model model, HttpServletResponse response) {
		model.addAttribute("state", "STATE_STRING");
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		response.setHeader("Pragma", "no-cache"); 
		response.setDateHeader("Expires", 0); 
		return "member/adminLogin";  
	}
	   
	// 학생 로그인 
	@PostMapping("/studentLogin")
		public String studentLogin(StudentVO vo, Model model, HttpSession session, HttpServletResponse response) {
			
		      vo = memService.studentLogin(vo);
		      
		      if (vo != null) {
		         response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
		         response.setHeader("Pragma", "no-cache"); 
		         response.setDateHeader("Expires", 0); 
		         
		         session.setAttribute("userId", memService.getStudent(vo).getId());
		         session.setAttribute("userName", memService.getStudent(vo).getName());
		         session.setAttribute("userStatus", memService.getStudent(vo).getStatus());
		         session.setAttribute("loginChk", "normal");
		         
		         return "redirect:/";
		         
		      } else {
		         session.setAttribute("userError", "로그인에러");
		         return "member/studentLogin"; 
		      }
		   }
	
	// 관리자(교수) 로그인 
	@PostMapping("/adminLogin")
		public String adminLogin(ProfessorVO vo, Model model, HttpSession session, HttpServletResponse response) {
			
			vo = memService.adminLogin(vo);
				
		      if (vo != null) {
		         response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
		         response.setHeader("Pragma", "no-cache"); 
		         response.setDateHeader("Expires", 0); 
		         
		         session.setAttribute("userId", memService.getAdmin(vo).getId());
		         session.setAttribute("userName", memService.getAdmin(vo).getName());
		         session.setAttribute("userStatus", memService.getAdmin(vo).getStatus());
		         session.setAttribute("loginChk", "normal");
		         
		         return "redirect:/";
		         
		      } else {
		         session.setAttribute("userError", "로그인에러");
		         return "member/adminLogin"; 
		      }
		   }
	
		}
		
		

