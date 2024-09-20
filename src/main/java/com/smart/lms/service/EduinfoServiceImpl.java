package com.smart.lms.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smart.lms.dao.EduinfoDAO;
import com.smart.lms.util.Pagination;
import com.smart.lms.vo.ClassVO;
import com.smart.lms.vo.ProfessorVO;
import com.smart.lms.vo.StudentVO;
import com.smart.lms.vo.TodateVO;

@Service("eduinfoService")
public class EduinfoServiceImpl implements EduinfoService {

	@Autowired
	private EduinfoDAO eduDAO;
	//해당 강의 수강생 인원 수 
	@Override
	public int attendanceTotalCnt(Pagination pg) {
		return eduDAO.attendanceTotalCnt(pg);
	}
	//해당 강의 수강생 리스트 가져오기
	@Override
	public List<TodateVO> attendanceList(Pagination pg) {
		return eduDAO.attendanceList(pg);
	}
	//해당 교수 id로 강의 리스트 가져오기
	@Override
	public List<ClassVO> classList(ClassVO vo) {
		return eduDAO.classList(vo);
	}
	//출석부 insert
	@Override
	public void insertAttendanceTx(List<TodateVO> toList) throws Exception  {
		for(int i = 0; i < toList.size(); i++) {
			eduDAO.insertAttendanceTx(toList.get(i));
		}
	}
	//출석부 데이터 받아오기
	@Override
	public List<TodateVO> getTodate(Pagination pg) {
		return eduDAO.getTodate(pg);
	}
	//출석부 출결상태 업데이트
	@Override
	public int updateAttendanceTx(TodateVO vo) throws Exception{
			return eduDAO.updateAttendanceTx(vo);
	}
	@Override
	public int toCnt(Date date) {
		return eduDAO.toCnt(date);
	}
	@Override
	public void classInsertTx(ClassVO vo) throws Exception {
		eduDAO.classInsertTx(vo);
	}
	@Override
	public int classAllTotalCnt(Pagination pg) {
		return  eduDAO.classAllTotalCnt(pg);
	}
	@Override
	public List<ClassVO> classAllList(Pagination pg) {
		return eduDAO.classAllList(pg);
	}
	@Override
	public ClassVO classSelect(int c_number) {
		return eduDAO.classSelect(c_number);
	}
	@Override
	public int classUpdateTx(ClassVO vo) throws Exception {
		return eduDAO.classUpdateTx(vo);
	}
	@Override
	public int stuAllCnt(Pagination pg) {
		return eduDAO.stuAllCnt(pg);
	}
	@Override
	public List<StudentVO> studentList(Pagination pg) {
		return eduDAO.studentList(pg);
	}
	@Override
	public int proAllCnt(Pagination pg) {
		return eduDAO.proAllCnt(pg);
	}
	@Override
	public List<ProfessorVO> proList(Pagination pg) {
		return eduDAO.proList(pg);
	}
	@Override
	public StudentVO stuInfo(String id) {
		return eduDAO.stuInfo(id);
	}
	
}
