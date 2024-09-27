package com.smart.lms.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	         boolean isMatch = passwordEncoder.matches(vo.getPwd(), svo.getPwd());
	    	//  boolean isMatch = vo.getPwd().equals(svo.getPwd());
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
//	    	    boolean isMatch = vo.getPwd().equals(pvo.getPwd());
	         boolean isMatch = passwordEncoder.matches(vo.getPwd(), pvo.getPwd());
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
	
	//학생 데이터 인서트
	@Override
	public void insertStudentTx(List<StudentVO> users) throws Exception {
		for(int i = 0; i < users.size(); i++) {
			String encryptedPassword = passwordEncoder.encode(users.get(i).getPwd()); 
			users.get(i).setPwd(encryptedPassword);
			memDAO.insertStudent(users.get(i));
		}
	}
	
	//교수 데이터 인서트
	@Override
	public void insertProfessorTx(List<ProfessorVO> professors) throws Exception {
		for(int i = 0; i < professors.size(); i++) {
			String encryptedPassword = passwordEncoder.encode(professors.get(i).getPwd()); 
			professors.get(i).setPwd(encryptedPassword);
			memDAO.insertProfessor(professors.get(i));
		}
	}
	

}
