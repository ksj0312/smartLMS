package com.smart.lms.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.smart.lms.vo.MyPageVO;
import com.smart.lms.vo.ProfessorVO;
import com.smart.lms.vo.StudentVO;

public interface MemberService {

	StudentVO studentLogin(StudentVO vo);
	
	boolean changePwd(StudentVO vo);
	
	StudentVO getStudent(StudentVO vo);

	ProfessorVO adminLogin(ProfessorVO vo);

	ProfessorVO getAdmin(ProfessorVO vo);

	void insertStudentTx(List<StudentVO> users) throws Exception;

	void insertProfessorTx(List<ProfessorVO> professors) throws Exception;

	StudentVO getUserInfo(String userId);

	void certifiedPhoneNumber(String tel, int code);

	void updateTel(String tel, String pasttel);

	void changeNewPwd(StudentVO vo);

	void updateMail(String email, String userId);

	StudentVO getId(String email);

	List<MyPageVO> getClassList(MyPageVO vo);

}
