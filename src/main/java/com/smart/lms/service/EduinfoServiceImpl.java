package com.smart.lms.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smart.lms.dao.EduinfoDAO;
import com.smart.lms.util.Pagination;
import com.smart.lms.vo.AttendClassVO;
import com.smart.lms.vo.ClassVO;
import com.smart.lms.vo.GradeVO;
import com.smart.lms.vo.ProfessorVO;
import com.smart.lms.vo.StuTaskVO;
import com.smart.lms.vo.StudentVO;
import com.smart.lms.vo.TaskVO;
import com.smart.lms.vo.TestVO;
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
   //수강생 검색 아작스
   @Override
   public List<AttendClassVO> attSearch(Pagination pg) {
      return eduDAO.attSearch(pg);
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
   //출석부 출결상태 업데이트
   @Override
   public int updateAttendanceTx(TodateVO vo) throws Exception{
         return eduDAO.updateAttendanceTx(vo);
   }
   //강의 등록
   @Override
   public void classInsertTx(ClassVO vo) throws Exception {
      eduDAO.classInsertTx(vo);
   }
   //강의 갯수
   @Override
   public int classAllTotalCnt(Pagination pg) {
      return  eduDAO.classAllTotalCnt(pg);
   }
   //강의 전체 리스트
   @Override
   public List<ClassVO> classAllList(Pagination pg) {
      return eduDAO.classAllList(pg);
   }
   //해당 강의 정보
   @Override
   public ClassVO classSelect(int c_number) {
      return eduDAO.classSelect(c_number);
   }
   //강의 정보 업데이트
   @Override
   public int classUpdateTx(ClassVO vo) throws Exception {
      return eduDAO.classUpdateTx(vo);
   }
   //학생 총 인원수
   @Override
   public int stuAllCnt(Pagination pg) {
      return eduDAO.stuAllCnt(pg);
   }
   //학생 리스트
   @Override
   public List<StudentVO> studentList(Pagination pg) {
      return eduDAO.studentList(pg);
   }
   //교수 총 인원수
   @Override
   public int proAllCnt(Pagination pg) {
      return eduDAO.proAllCnt(pg);
   }
   //교수 리스트
   @Override
   public List<ProfessorVO> proList(Pagination pg) {
      return eduDAO.proList(pg);
   }
   //학생 정보
   @Override
   public StudentVO stuInfo(String id) {
      return eduDAO.stuInfo(id);
   }
   //교수 정보
   @Override
   public ProfessorVO proInfo(String id) {
      return eduDAO.proInfo(id);
   }
   //출석 정보
   @Override
   public List<AttendClassVO> attInfo(int c_number) {
      return eduDAO.attInfo(c_number);
   }
   //출석 정보에서 검색 기능
   @Override
   public List<AttendClassVO> attStuSearch(Pagination pg) {
      return eduDAO.attStuSearch(pg);
   }
   //성적 등록 
   @Override
   public void insertGradeTx(List<GradeVO> gList) throws Exception {
      
      Map<String, Integer> map = new HashMap<>();
      for(int i = 0; i < gList.size(); i++) {
         map.put(gList.get(i).getId(), gList.get(i).getLevel());
      }
      List<String> keySet = new ArrayList<>(map.keySet());
      
      Collections.sort(keySet, (value1, value2) -> (map.get(value2).compareTo(map.get(value1))));
      
      int stuTotal = gList.size();
      int ap = (int)Math.round(stuTotal * 0.1);
      int a = (int)Math.round(stuTotal * 0.115) + ap;
      int am = (int)Math.round(stuTotal * 0.125) + a;
      int bp = (int)Math.round(stuTotal * 0.15) + am;
      int b = (int)Math.round(stuTotal * 0.175) + bp;
      int bm = (int)Math.round(stuTotal * 0.185) + b;
      
       for (int i = 0; i < keySet.size(); i++) {
           String id = keySet.get(i);
           GradeVO grade = gList.stream().filter(g -> g.getId().equals(id)).findFirst().orElse(null);
           if (i < ap) {
               grade.setGrade("A+");  
           } else if (i < a) {
               grade.setGrade("A");  
           } else if (i < am) {
               grade.setGrade("A-");  
           } else if (i < bp) {
               grade.setGrade("B+");  
           } else if (i < b) {
               grade.setGrade("B");  
           } else if (i < bm) {
               grade.setGrade("B-");  
           } else {
               grade.setGrade("C"); 
           }
       }
       //성적 등록
      for(int i = 0; i < gList.size(); i++) {
         eduDAO.insertGradeTx(gList.get(i));
      }
      //해당 시험 상태 업데이트
      eduDAO.testStatusUpTx(gList.get(0).getG_number());
   }
   
   //해당 강의 수강생 성적 리스트
   @Override
   public List<GradeVO> gradeList(Pagination pg) {
      return eduDAO.gradeList(pg);
   }
   //시험 등록
   @Override
   public int testInsertTx(TestVO vo) throws Exception {
       return eduDAO.testInsertTx(vo);
   }
   //시험 정보
   @Override
   public List<TestVO> testSelect(TestVO vo) {
      return eduDAO.testSelect(vo);
   }
   //시험 정보 업데이트
   @Override
   public List<TestVO> testSelectUp(TestVO vo) {
      return eduDAO.testSelectUp(vo);
   }
   //성적 수정
   @Override
   public int gradeUpdateTx(GradeVO vo) throws Exception {
      return eduDAO.gradeUpdateTx(vo);
   }
   //성적 리스트에서 학생 검색
   @Override
   public List<GradeVO> gradeSearch(Pagination pg) {
      return eduDAO.gradeSearch(pg);
   }
   
   //과제 목록
   @Override
   public List<TaskVO> getTaskList(int c_number){
	   return eduDAO.getTaskList(c_number);
   }
   
   //과제 등록
   @Override
   public void taskInsertTx(TaskVO vo) {
       eduDAO.taskInsertTx(vo);
   }
   
   //과제 정보
   @Override
   public TaskVO getTask(int t_number) {
      return eduDAO.getTask(t_number);
   }
   
   //학생 과제 제출 정보
   @Override
   public StuTaskVO getStuTask(int t_number, String id) {
      return eduDAO.getStuTask(t_number, id);
   }
   
   
   //학생 과제 등록
   @Override
   public void insertStuTaskTx(StuTaskVO vo) {
       eduDAO.insertStuTaskTx(vo);
   }
   
 //과제를 제출한 학생들의 목록
   @Override
   public List<StuTaskVO> taskAllList(int t_number){
	   return eduDAO.taskAllList(t_number);
   }
   
   }
   
   
