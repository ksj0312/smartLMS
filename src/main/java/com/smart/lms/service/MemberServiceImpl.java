package com.smart.lms.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.smart.lms.dao.MemberDAO;
import com.smart.lms.vo.ProfessorVO;
import com.smart.lms.vo.StudentVO;


@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memDAO;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder; 

	//학생 로그인
	@Override
	public StudentVO studentLogin(StudentVO vo) {
		 StudentVO svo = memDAO.getStudent(vo);

	      if (svo != null) {
//	         boolean isMatch = passwordEncoder.matches(vo.getPwd(), svo.getPwd());
	    	  boolean isMatch = vo.getPwd().equals(svo.getPwd());
	         if (isMatch) {
	            return svo;
	         }
	      }
	      return null;
	   }

	//학생 정보 한 줄 가져오기
	@Override
	public StudentVO getStudent(StudentVO vo) {
		return  memDAO.getStudent(vo);
	}
	//관리자(교수) 로그인
	@Override
	public ProfessorVO adminLogin(ProfessorVO vo) {
		ProfessorVO pvo = memDAO.getAdmin(vo);
		
	      if (pvo != null) {
//	         boolean isMatch = passwordEncoder.matches(vo.getPwd(), pvo.getPwd());
	         boolean isMatch = vo.getPwd().equals(pvo.getPwd());
	         if(isMatch){
	            return pvo;
	         }
	      }
	      return null;
	}
	//관리자(교수) 한 줄 가져오기
	@Override
	public ProfessorVO getAdmin(ProfessorVO vo) {
		return  memDAO.getAdmin(vo);
	}
	

}
