package com.smart.lms.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	
}
