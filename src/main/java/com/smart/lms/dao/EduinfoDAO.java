package com.smart.lms.dao;

import java.sql.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.smart.lms.util.Pagination;
import com.smart.lms.vo.ClassVO;
import com.smart.lms.vo.ProfessorVO;
import com.smart.lms.vo.StudentVO;
import com.smart.lms.vo.TodateVO;

@Repository
public class EduinfoDAO {
	
	 @Autowired private SqlSessionTemplate mybatis;

	public int attendanceTotalCnt(Pagination pg) {
		return mybatis.selectOne("eduinfoDAO.attendanceTotalCnt",pg);
	}

	public List<TodateVO> attendanceList(Pagination pg) {
		return mybatis.selectList("eduinfoDAO.attendanceList", pg);
	}

	public List<ClassVO> classList(ClassVO vo) {
		return mybatis.selectList("eduinfoDAO.classList", vo);
	}

	public void insertAttendanceTx(TodateVO vo) {
		mybatis.insert("eduinfoDAO.insertAttendanceTx", vo);
	}

	public int updateAttendanceTx(TodateVO vo) {
		return mybatis.update("eduinfoDAO.updateAttendanceTx", vo);
	}

	public List<TodateVO> getTodate(Pagination pg) {
		return mybatis.selectList("eduinfoDAO.getTodate", pg);
	}

	public int toCnt(Date date) {
		return mybatis.selectOne("eduinfoDAO.toCnt", date);
	}

	public void classInsertTx(ClassVO vo) {
		mybatis.insert("eduinfoDAO.classInsertTx", vo);
	}

	public int classAllTotalCnt(Pagination pg) {
		return mybatis.selectOne("eduinfoDAO.classAllTotalCnt",pg);
	}

	public List<ClassVO> classAllList(Pagination pg) {
		return mybatis.selectList("eduinfoDAO.classAllList", pg);
	}

	public ClassVO classSelect(int c_number) {
		return mybatis.selectOne("eduinfoDAO.classSelect",c_number);
	}

	public int classUpdateTx(ClassVO vo) {
		return mybatis.update("eduinfoDAO.classUpdateTx", vo);
	}

	public int stuAllCnt(Pagination pg) {
		return mybatis.selectOne("eduinfoDAO.stuAllCnt",pg);
	}

	public List<StudentVO> studentList(Pagination pg) {
		return  mybatis.selectList("eduinfoDAO.studentList",pg);
	}

	public int proAllCnt(Pagination pg) {
		return  mybatis.selectOne("eduinfoDAO.proAllCnt",pg);
	}

	public List<ProfessorVO> proList(Pagination pg) {
		return  mybatis.selectList("eduinfoDAO.proList",pg);
	}

	public StudentVO stuInfo(String id) {
		return mybatis.selectOne("eduinfoDAO.stuInfo", id);
	}



	 
}
