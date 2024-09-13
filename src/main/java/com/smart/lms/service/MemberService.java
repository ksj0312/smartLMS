package com.smart.lms.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.smart.lms.vo.ProfessorVO;
import com.smart.lms.vo.StudentVO;

public interface MemberService {

	StudentVO studentLogin(StudentVO vo);

	StudentVO getStudent(StudentVO vo);

	ProfessorVO adminLogin(ProfessorVO vo);

	ProfessorVO getAdmin(ProfessorVO vo);

	void insertStudentTx(List<StudentVO> users) throws Exception;

	void insertProfessorTx(List<ProfessorVO> professors) throws Exception;


}
