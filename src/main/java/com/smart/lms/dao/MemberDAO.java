package com.smart.lms.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.smart.lms.vo.MyPageVO;
import com.smart.lms.vo.ProfessorVO;
import com.smart.lms.vo.StudentVO;

@Repository
public class MemberDAO {
	
	 @Autowired private SqlSessionTemplate mybatis;

	public StudentVO getStudent(StudentVO vo) {
		return mybatis.selectOne("memberDAO.getStudent", vo);
	}

	public ProfessorVO getAdmin(ProfessorVO vo) {
		return  mybatis.selectOne("memberDAO.getAdmin", vo);
	}

	public void insertStudent(StudentVO users) {
		 mybatis.insert("memberDAO.insertStudent", users);
	}

	public void insertProfessor(ProfessorVO users) {
		 mybatis.insert("memberDAO.insertProfessor", users);
		
	}

	public StudentVO getUserInfo(String userId) {
		return mybatis.selectOne("memberDAO.getUserInfo", userId);
	}

	public void updateTel(String tel, String pasttel) {
		Map<String, Object> params = new HashMap<>();
		params.put("tel", tel);
		params.put("pasttel", pasttel);
		mybatis.update("memberDAO.updateTel", params);
	}

	public StudentVO changePwd(StudentVO vo) {
		return mybatis.selectOne("memberDAO.changePwd", vo);
		
	}

	public void changeNewPwd(StudentVO vo) {
		mybatis.update("memberDAO.changeNewPwd", vo);
		
	}

	public void updateMail(String email, String userId) {
		Map<String, Object> params = new HashMap<>();
		params.put("email", email);
		params.put("userId", userId);
		mybatis.update("memberDAO.updateMail", params);
		
	}

	public StudentVO getId(String email) {
		return mybatis.selectOne("memberDAO.getId",email);
		
	}

	public List<MyPageVO> getClassList(MyPageVO vo) {
		return mybatis.selectList("memberDAO.getClassList", vo);
	}



}
