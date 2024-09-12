package com.smart.lms.service;

import javax.servlet.http.HttpSession;

import com.smart.lms.vo.ProfessorVO;
import com.smart.lms.vo.StudentVO;

public interface MemberService {

	StudentVO studentLogin(StudentVO vo);

	StudentVO getStudent(StudentVO vo);

	ProfessorVO adminLogin(ProfessorVO vo);

	ProfessorVO getAdmin(ProfessorVO vo);

}
