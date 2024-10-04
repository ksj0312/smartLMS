package com.smart.lms.service;

import java.util.List;

import com.smart.lms.util.Pagination;
import com.smart.lms.vo.AttendClassVO;
import com.smart.lms.vo.ClassVO;
import com.smart.lms.vo.GradeVO;
import com.smart.lms.vo.ProfessorVO;
import com.smart.lms.vo.StudentVO;
import com.smart.lms.vo.TaskVO;
import com.smart.lms.vo.TestVO;
import com.smart.lms.vo.TodateVO;

public interface EduinfoService {

   public int attendanceTotalCnt(Pagination pg);

   public List<TodateVO> attendanceList(Pagination pg);

   public List<ClassVO> classList(ClassVO vo);

   public void insertAttendanceTx(List<TodateVO> toList) throws Exception;

   public int updateAttendanceTx(TodateVO vo) throws Exception;

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

   public ProfessorVO proInfo(String id);

   public List<AttendClassVO> attSearch(Pagination pg);

   public List<AttendClassVO> attInfo(int c_number);

   public List<AttendClassVO> attStuSearch(Pagination pg);

   public List<GradeVO> gradeList(Pagination pg);

   public int testInsertTx(TestVO vo) throws Exception;

   public void insertGradeTx(List<GradeVO> gList) throws Exception;

   public List<TestVO> testSelect(TestVO vo);

   public List<TestVO> testSelectUp(TestVO vo);

   public int gradeUpdateTx(GradeVO vo) throws Exception;

   public List<GradeVO> gradeSearch(Pagination pg);

   public void taskInsertTx(TaskVO vo);

   public List<TaskVO> getTaskList(int c_number);

   public TestVO testInfo(String g_number);

   public int testUpdateTx(TestVO vo) throws Exception;

   public int testAllCnt(Pagination pg);

   public List<TestVO> testAllSelect(Pagination pg);

}
