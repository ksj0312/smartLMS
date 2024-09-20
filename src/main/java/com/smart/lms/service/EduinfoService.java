package com.smart.lms.service;

import java.sql.Date;
import java.util.List;

import com.smart.lms.util.Pagination;
import com.smart.lms.vo.ClassVO;
import com.smart.lms.vo.ProfessorVO;
import com.smart.lms.vo.StudentVO;
import com.smart.lms.vo.TodateVO;

public interface EduinfoService {

	public int attendanceTotalCnt(Pagination pg);

	public List<TodateVO> attendanceList(Pagination pg);

	public List<ClassVO> classList(ClassVO vo);

	public void insertAttendanceTx(List<TodateVO> toList) throws Exception;

	public int updateAttendanceTx(TodateVO vo) throws Exception;

	public List<TodateVO> getTodate(Pagination pg);

	public int toCnt(Date date);

	public void classInsertTx(ClassVO vo) throws Exception;

	public int classAllTotalCnt(Pagination pg);

	public List<ClassVO> classAllList(Pagination pg);

	public ClassVO classSelect(int c_number);

	public int classUpdateTx(ClassVO vo) throws Exception;

	public int stuAllCnt(Pagination pg);

	public List<StudentVO> studentList(Pagination pg);

	public int proAllCnt(Pagination pg);

	public List<ProfessorVO> proList(Pagination pg);

	public StudentVO stuInfo(String id);


}
