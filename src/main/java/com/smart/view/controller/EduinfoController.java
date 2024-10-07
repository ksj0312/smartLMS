package com.smart.view.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.smart.lms.service.EduinfoService;
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

@Controller
public class EduinfoController {
	@Autowired
	private EduinfoService eduinfoService;
	
	
	//출석부 -> classList 받아오기
	@GetMapping("/professor/students/classes")
	public String classList(HttpSession session, Model model, ClassVO vo) {
		vo.setC_id((String) session.getAttribute("userId"));
		List<ClassVO> cList = new ArrayList<ClassVO>();
		cList = eduinfoService.classList(vo);
		model.addAttribute("classList" , cList );
		model.addAttribute("classListcnt", cList.size());
		return "eduinfo/classList";
	}

	//출석페이지
	@GetMapping("/professor/students/todate")
	public String getUserList( Pagination pg, Model model, HttpSession session) {
	
		model.addAttribute("attendanceList", eduinfoService.attendanceList(pg));
		
		return "eduinfo/todate";
	}
	
	//출석페이지 검색 아작스
	@GetMapping("/professor/students/todate/search")
	@ResponseBody
	public Map<String, Object> selectkind(Pagination pg) {
		List<AttendClassVO> attList = eduinfoService.attSearch(pg);
		Map<String, Object> aList = new HashMap<String, Object>();
		int length = attList.size();
		aList.put("attList", attList);
		aList.put("length", length);
		return aList;
	}
	
	//출석부 테이블에 INSERT
	@PostMapping("/professor/students/todate")
	public String insertAttendanceTx(TodateVO vo, HttpServletRequest request, RedirectAttributes redirectAttributes) {
		try {
		 Enumeration<String> pname = request.getParameterNames();
		 List<TodateVO> toList = new ArrayList<>();
		 int c_number = vo.getC_number();
		 Date a_date = vo.getA_date();
		    
		    while (pname.hasMoreElements()) { 
		        String paramName = pname.nextElement(); 
		        String id = "";
		        
		        if (paramName.startsWith("id_")) {
		             id = request.getParameter(paramName); 
		             String status = request.getParameter("a_status_" + id);
		             
		             if (id == null || status == null || a_date == null) {
		                    redirectAttributes.addFlashAttribute("msg", "fail");
		                    return "redirect:/professor/students/todate";
		                }
		             
		             TodateVO tvo = new TodateVO();
		             tvo.setC_number(c_number);
		             tvo.setId(id);
		             tvo.setA_status(status);
		             tvo.setA_date(a_date);
		             toList.add(tvo);
		        }
		    }
				eduinfoService.insertAttendanceTx(toList);
				redirectAttributes.addFlashAttribute("msg", "success");
				
				return "redirect:/professor/students/classes";
				
			} catch (Exception e) {
				e.printStackTrace();
				redirectAttributes.addFlashAttribute("msg", "fail");
				return "redirect:/professor/students/classes";
			}
	}
	
	//출석 상태 변경
	@PutMapping("/professor/students/todate")
	@ResponseBody
	public ResponseEntity<TodateVO> updateAttendance(@RequestBody TodateVO vo) throws Exception {
			int cnt = eduinfoService.updateAttendanceTx(vo);
			if(cnt > 0) {
				return new ResponseEntity<>(vo, HttpStatus.OK);
			}
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
	}
	
	//강의 등록 페이지 이동
	@GetMapping("/admin/class")
	public String classInsertPage() {
		return "eduinfo/classInsert";
	}
	
	//강의등록
	@PostMapping("/admin/class")
	public String classInsert(ClassVO vo) throws Exception {
		eduinfoService.classInsertTx(vo);
		return "redirect:/admin/classes";
	}
	
	//관리자 전체 강의 목록
	@GetMapping("/admin/classes")
	public String classAllList(@ModelAttribute Pagination pg, Model model, HttpSession session) {

		int currPageNo = pg.getCurrPageNo();
		int range = pg.getRange();

		int totalCnt = eduinfoService.classAllTotalCnt(pg);

		pg.pageInfo(currPageNo, range, totalCnt);

		model.addAttribute("pagination", pg);
		model.addAttribute("classAllList", eduinfoService.classAllList(pg));
		
		return "eduinfo/classAllList";
	}
	
	//관리자 강의 상세 페이지 & 수정 
	@GetMapping("/admin/classinfo")
	public ResponseEntity<ClassVO> classInfo(int c_number) {
		ClassVO vo = eduinfoService.classSelect(c_number);
		
		if (vo != null) {
			return new ResponseEntity<>(vo, HttpStatus.OK);
		} else {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
	}
		
	//관리자 강의 정보 수정
	@PutMapping("/admin/classinfo")
	@ResponseBody
	public ResponseEntity<ClassVO> classUpdate(@RequestBody ClassVO vo) throws Exception {
		int cnt = eduinfoService.classUpdateTx(vo);
		if(cnt > 0 ) {
			return new ResponseEntity<>(vo, HttpStatus.OK);
		}else {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
	}

	//classList 받아오기
	@GetMapping("/admin/attendance")
	public String attendance(@ModelAttribute Pagination pg, Model model, HttpSession session) {
		int currPageNo = pg.getCurrPageNo();
		int range = pg.getRange();

		int totalCnt = eduinfoService.classAllTotalCnt(pg);

		pg.pageInfo(currPageNo, range, totalCnt);

		model.addAttribute("pagination", pg);
		model.addAttribute("classAllList", eduinfoService.classAllList(pg));
		
		return "eduinfo/attendance";
	}
	
	//관리자 학생 리스트 불러오기 
	@GetMapping("/admin/students")
	public String studentList(@ModelAttribute Pagination pg, Model model) {
		
		int currPageNo = pg.getCurrPageNo();
		int range = pg.getRange();

		int totalCnt = eduinfoService.stuAllCnt(pg);

		pg.pageInfo(currPageNo, range, totalCnt);

		model.addAttribute("pagination", pg);
		model.addAttribute("stuList", eduinfoService.studentList(pg));
		
		return "member/studentList";
	}
	
	//관리자 해당 학생 정보 불러오기 
	@GetMapping("/admin/students/student")
	public ResponseEntity<StudentVO> stuInfo(String id) {
		
		StudentVO vo = eduinfoService.stuInfo(id);
		
		if (vo != null) {
			return new ResponseEntity<>(vo, HttpStatus.OK);
		} else {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
	}
	
	//관리자 교수 리스트 불러오기 
	@GetMapping("/admin/professors")
	public String proList(@ModelAttribute Pagination pg, Model model) {
		
		int currPageNo = pg.getCurrPageNo();
		int range = pg.getRange();

		int totalCnt = eduinfoService.proAllCnt(pg);

		pg.pageInfo(currPageNo, range, totalCnt);

		model.addAttribute("pagination", pg);
		model.addAttribute("proList", eduinfoService.proList(pg));
		
		return "member/profList";
	}
	
	//관리자 해당 교수 정보 불러오기 
	@GetMapping("/admin/professors/professor")
	public ResponseEntity<ProfessorVO> proInfo(String id) {
		
		ProfessorVO vo = eduinfoService.proInfo(id);
		if (vo != null) {
			return new ResponseEntity<>(vo, HttpStatus.OK);
		} else {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
	}
	
	//관리자 수강학생 정보 불러오기 
	@GetMapping("/admin/attendance/student")
	@ResponseBody
	public Map<String, Object> attInfo(@RequestParam("c_number") int c_number) {
		
		List<AttendClassVO> attList = eduinfoService.attInfo(c_number);
		Map<String, Object> aList = new HashMap<String, Object>();
		int length = attList.size();
		aList.put("attList", attList);
		aList.put("length", length);
		return aList;
	}
	
	//관리자 수강생 검색  
		@GetMapping("/admin/attendance/student/search")
		@ResponseBody
		public Map<String, Object> attStuSearch(@ModelAttribute Pagination pg) {
			List<AttendClassVO> attStuList = eduinfoService.attStuSearch(pg);
			Map<String, Object> sList = new HashMap<String, Object>();
			int length = attStuList.size();
			sList.put("attStuList", attStuList);
			sList.put("length", length);
			return sList;
		}
		
		//시험등록 -> classList 받아오기
		@GetMapping("/professor/test/classes")
				public String testclassList(HttpSession session, Model model, ClassVO vo) {
					vo.setC_id((String) session.getAttribute("userId"));
					List<ClassVO> cList = new ArrayList<ClassVO>();
					cList = eduinfoService.classList(vo);
					model.addAttribute("classList" , cList );
					model.addAttribute("classListcnt", cList.size());
					return "eduinfo/testclassList";
				}
		
		//시험수정 -> classList 받아오기
		@GetMapping("/professor/test/classlist")
		public String testclassList2(HttpSession session, Model model, ClassVO vo) {
			vo.setC_id((String) session.getAttribute("userId"));
			List<ClassVO> cList = new ArrayList<ClassVO>();
			cList = eduinfoService.classList(vo);
			model.addAttribute("classList" , cList );
			model.addAttribute("classListcnt", cList.size());
			return "eduinfo/testclassList2";
		}
		
		//시험 수정 -> 시험 목록 
		@GetMapping("/professor/test/classlist/test")
		public String testSelect2(Model model, @ModelAttribute Pagination pg) {
			
			int currPageNo = pg.getCurrPageNo();
			int range = pg.getRange();

			int totalCnt = eduinfoService.testAllCnt(pg);

			pg.pageInfo(currPageNo, range, totalCnt);
			
			model.addAttribute("pagination", pg);
			model.addAttribute("testListcnt", totalCnt);
			model.addAttribute("tList", eduinfoService.testAllSelect(pg));
			return "eduinfo/testList2";
		}
		
		//시험 수정 -> 시험 선택
		@GetMapping("/professor/test/classlist/testinfo")
		public ResponseEntity<TestVO> testInfo(String g_number) {
				
			TestVO vo = eduinfoService.testInfo(g_number);
				if (vo != null) {
					return new ResponseEntity<>(vo, HttpStatus.OK);
				} else {
					return new ResponseEntity<>(HttpStatus.NOT_FOUND);
				}
			}
		//시험 수정
		@PutMapping("/professor/test")
		@ResponseBody
		public ResponseEntity<TestVO> testUpdate(@RequestBody TestVO vo) throws Exception{
			int cnt = eduinfoService.testUpdateTx(vo);
			if(cnt > 0 ) {
				return new ResponseEntity<>(vo, HttpStatus.OK);
			}else {
				return new ResponseEntity<>(HttpStatus.NOT_FOUND);
			}
		}
		
		//시험 정보 등록 페이지 이동
		@GetMapping("/professor/test/classes/test")
		public String testInsertPage(int c_number) {
			return "eduinfo/testInsert";
		}
		
		//시험 정보 INSERT
		@PostMapping("/professor/test/classes/test")
		public String testInsertTx(@ModelAttribute TestVO vo, HttpServletRequest request, RedirectAttributes redirectAttributes,HttpSession session) throws Exception {
			vo.setId((String) session.getAttribute("userId"));	
			int cnt = eduinfoService.testInsertTx(vo);
				if(cnt > 0) {
					redirectAttributes.addFlashAttribute("msg", "success");
					return "redirect:/professor/test/classes";
				}else {
					redirectAttributes.addFlashAttribute("msg", "fail");
					return "redirect:/professor/test/classes";
				}
		}
		
		//성적 등록 -> classList 받아오기
		@GetMapping("/professor/students/classlist")
		public String gradeclassList(HttpSession session, Model model, ClassVO vo) {
			vo.setC_id((String) session.getAttribute("userId"));
			List<ClassVO> cList = new ArrayList<ClassVO>();
			cList = eduinfoService.classList(vo);
			model.addAttribute("classList" , cList );
			model.addAttribute("classListcnt", cList.size());
			return "eduinfo/gclassList";
		}
		
		//성적 등록 -> 시험 목록 선택 페이지
		@GetMapping("/professor/students/grade/test")
		public String testSelectGrade(Model model, @ModelAttribute TestVO vo, @RequestParam ("c_number") int c_number) {
			vo.setC_number(c_number);
			List<TestVO> tList = new ArrayList<TestVO>();
			tList = eduinfoService.testSelect(vo);
			System.out.println("tList " + tList);
			
			ClassVO classvo = eduinfoService.classSelect(c_number);

			
			model.addAttribute("tList", tList);
			model.addAttribute("testListcnt", tList.size());
			model.addAttribute("c_name", classvo.getC_name());

			return "eduinfo/testList";
		}
		
		
		//성적 등록 -> 시험 목록 선택 페이지 -> 성적 등록(수강생 목록 불러옴)
		@GetMapping("/professor/students/grade")
		public String gradeStuList(Pagination pg, Model model) {
			
			model.addAttribute("gradeStuList", eduinfoService.attendanceList(pg));
			
			return "eduinfo/gradeInsert";
		}
				
		//성적 테이블에 INSERT
		@PostMapping("/professor/students/grade")
		public String insertGradeTx(@ModelAttribute GradeVO vo, HttpServletRequest request, RedirectAttributes redirectAttributes) {
			try {
			 Enumeration<String> pname = request.getParameterNames();
			 List<GradeVO> gList = new ArrayList<>();
			 int c_number = vo.getC_number();
			 int g_number = vo.getG_number();
			 
			    
			    while (pname.hasMoreElements()) { 
			        String paramName = pname.nextElement(); 
			        String id = "";
			        
			        if (paramName.startsWith("id_")) {
			             id = request.getParameter(paramName); 
			             int level = Integer.parseInt(request.getParameter("level_" + id));
			             
			             if (id == null) {
			                    redirectAttributes.addFlashAttribute("msg", "null");
			                    return "redirect:/gradeInsert";
			                }
			             
			             GradeVO gvo = new GradeVO();
			             gvo.setId(id);
			             gvo.setLevel(level);
			             gvo.setC_number(c_number);
			             gvo.setG_number(g_number);
			             
			             gList.add(gvo);
			        }
			    }
					eduinfoService.insertGradeTx(gList);
					redirectAttributes.addFlashAttribute("msg", "success");
					
					return "redirect:/professor/students/class";
					
				} catch (Exception e) {
					e.printStackTrace();
					redirectAttributes.addFlashAttribute("msg", "fail");
					return "redirect:/professor/students/classlist";
				}
		}
		
		//교수 강의 리스트 -> 성적 조회/수정으로 연결 
		@GetMapping("/professor/students/class")
		public String gradeclassList2(HttpSession session, Model model, ClassVO vo) {
			vo.setC_id((String) session.getAttribute("userId"));
			List<ClassVO> cList = new ArrayList<ClassVO>();
			cList = eduinfoService.classList(vo);
			model.addAttribute("classList" , cList );
			model.addAttribute("classListcnt", cList.size());
			return "eduinfo/gclassList2";
		}
		
		//성적 조회/수정 -> 시험 목록 선택 페이지
		@GetMapping("/professor/students/grades")
		public String testSelectUpdate(Model model, @ModelAttribute TestVO vo) {
			List<TestVO> tList = new ArrayList<TestVO>();
			tList = eduinfoService.testSelectUp(vo);
			model.addAttribute("tList", tList);
			model.addAttribute("testListcnt", tList.size());
			return "eduinfo/gradeUpdatePage";
		}
		
		//교수 성적 조회/수정 (수강생 목록 불러옴)
		@GetMapping("/professor/students/grades/students")
		public String gradeList(@ModelAttribute Pagination pg, Model model) {
			
			model.addAttribute("gradeList", eduinfoService.gradeList(pg));
			
			return "eduinfo/gradeList";
		}
		
		//교수 성적 등급 수정
		@PutMapping("/professor/students/grade")
		@ResponseBody
		public ResponseEntity<GradeVO> gradeUpdate(@RequestBody GradeVO vo) throws Exception {
			int cnt = eduinfoService.gradeUpdateTx(vo);
			if(cnt > 0 ) {
				return new ResponseEntity<>(vo, HttpStatus.OK);
			}else {
				return new ResponseEntity<>(HttpStatus.NOT_FOUND);
			}
		}
		//교수 성적 수강생 검색  
		@GetMapping("/professor/students/grades/students/search")
		@ResponseBody
		public Map<String, Object> gradeSearch(@ModelAttribute Pagination pg) {
			List<GradeVO> gradeList = eduinfoService.gradeList(pg);
			Map<String, Object> gList = new HashMap<String, Object>();
			int length = gradeList.size();
			gList.put("gradeList", gradeList);
			gList.put("length", length);
			return gList;
		}
		
		//학생 성적 조회
		@GetMapping("/student/grade")
		public String gradeSelectStu (int c_number, String id, Model model) {
				System.out.println("c_number " + c_number);
				List<GradeVO> gradestuList= eduinfoService.gradeSelectStu(c_number ,id);
				ClassVO classvo = eduinfoService.classSelect(c_number);
				
				model.addAttribute("gradestuList", gradestuList);
				model.addAttribute("c_number" , c_number);
				model.addAttribute("c_name", classvo.getC_name());
				model.addAttribute("gradecnt", gradestuList.size());
				model.addAttribute("listsize", gradestuList.size());
				
			return "/eduinfo/stuGradeList";
		}
		
		//학생의 나의 시험 성적 조죄
		@GetMapping("/student/mygrade")
		public String getTestGrade(int c_number, int g_number, String id, String test_type, Model model) {
			GradeVO grade = eduinfoService.getTestGrade(g_number, id);
			ClassVO classvo = eduinfoService.classSelect(c_number);

			
			System.out.println(grade);
			model.addAttribute("grade" , grade);
			model.addAttribute("c_number", c_number);
			model.addAttribute("c_name", classvo.getC_name());
			model.addAttribute("test_type", test_type);

			return "/eduinfo/stuTestGrade";
			
		}
		
		
//---------------과제 컨트롤러  --------------------
		//과제 페이지 이동
		@GetMapping("/task/page")
		public String taskListPage(@RequestParam ("c_number") int c_number, Model model) {
			ClassVO classvo = eduinfoService.classSelect(c_number);

			model.addAttribute("c_number" , c_number);
			model.addAttribute("c_name", classvo.getC_name());
			return "/member/studentPage";
		}
		
		//마감일이 지나지않은 과제 목록
		@GetMapping("/task/list")
		public String taskList(@RequestParam ("c_number") int c_number, Model model) {
			model.addAttribute("taskList", eduinfoService.getTaskList(c_number));
			return "eduinfo/taskList";
		}
		
		//과제 등록 페이지 이동
		@GetMapping("/task")
			public String taskInsertPage() {
				return "eduinfo/taskInsert";
			}
		
		//과제 등록
		@PostMapping("/task")
		public String taskInsert(TaskVO vo) throws IllegalStateException, IOException {
				 
				
			// 파일 처리 로직
		       MultipartFile file = vo.getUploadFile();
		       if (file != null && !file.isEmpty()) {
		           // 파일 저장 경로 설정
		           String uploadPath = "/resources/upfile/"; // 저장할 경로 설정
		           String fileName = file.getOriginalFilename();
		           
		           // 파일을 해당 경로에 저장
		           File dest = new File(uploadPath + fileName);
		           file.transferTo(dest);
		           
		           // StuTaskVO에 파일 경로 설정
		           vo.setT_file1(uploadPath + fileName); // 파일 경로를 BoardVO의 b_file1에 설정

		           System.out.println("파일 저장 성공: " + fileName);
		       } else {
		           System.out.println("파일이 업로드되지 않았습니다.");
		       }
			
		       	eduinfoService.taskInsertTx(vo);
			return "redirect:/task/class?status=insert";
		}
		
		//과제등록 -> classList 받아오기
		@GetMapping("/task/class")
		public String taskclassList(@RequestParam ("status") String status,  HttpSession session, Model model, ClassVO vo) {
			vo.setC_id((String) session.getAttribute("userId"));
			List<ClassVO> cList = new ArrayList<ClassVO>();
			cList = eduinfoService.classList(vo);
			model.addAttribute("classList" , cList );
			model.addAttribute("classListcnt", cList.size());
			model.addAttribute("status" , status);
			
			return "eduinfo/taskclassList";
		}
		
		
		//마이페이지 시험 -> 시험 목록 페이지
				@GetMapping("/student/test")
				public String testSelectStu(@RequestParam ("c_number") int c_number,  Model model, @ModelAttribute TestVO vo, ClassVO vo1) {
					vo.setC_number(c_number);
					
					List<TestVO> tList = eduinfoService.testSelect(vo);
					
					ClassVO classvo = eduinfoService.classSelect(c_number);
					
					model.addAttribute("tList", tList);
					model.addAttribute("testListcnt", tList.size());
					model.addAttribute("c_name", classvo.getC_name());
					model.addAttribute("c_number", c_number);
					
					return "eduinfo/stuTestList";
				}
		
		//과제 목록 선택 페이지
		@GetMapping("/student/task")
		public String taskSelect(Model model, @RequestParam ("c_number") int c_number, ClassVO vo) {
			List<TaskVO> taskList = eduinfoService.getTaskList(c_number);
			
			ClassVO classvo = eduinfoService.classSelect(c_number);			
			
			model.addAttribute("taskList", taskList);
			model.addAttribute("taskListcnt", taskList.size());
			model.addAttribute("c_name", classvo.getC_name());
			model.addAttribute("c_number", c_number);
			
			return "eduinfo/taskList";
		}
		
		//과제 게시판 들어가기
		@GetMapping("/task/info")
		public String taskBoard(@RequestParam ("t_number") int t_number, @RequestParam ("id") String id,   HttpSession session, Model model, TaskVO vo, StuTaskVO vo1) {
			vo.setId((String) session.getAttribute("userId"));
			String usertype = (String) session.getAttribute("userType");
			
			//과제 정보
			TaskVO task = eduinfoService.getTask(t_number); 
			
			ClassVO classvo = eduinfoService.classSelect(task.getC_number());			
			
			
			if("교수".equals(usertype) || "관리자".equals(usertype)) {
				//해당학생이 제출한 과제 조회
				StuTaskVO stutask = eduinfoService.getStuTask(t_number, id );
				model.addAttribute("stutask", stutask);
//				System.out.println("교수" +stutask);

			}else {
				//학생이 제출한 과제
				StuTaskVO stutask = eduinfoService.getStuTask(t_number, (String) session.getAttribute("userId"));
				model.addAttribute("stutask", stutask);
//				System.out.println("학생" +stutask);

			}
			model.addAttribute("task" , task);
			model.addAttribute("c_number", task.getC_number());
			model.addAttribute("c_name", classvo.getC_name());

			return "eduinfo/taskBoard";
		}
		
		//학생 과제 등록페이지 이동
		@GetMapping("/student/task/page")
		public String insertStuTaskPage(@RequestParam ("c_number") int c_number, @RequestParam ("t_number") int t_number, Model model, HttpSession session) {
			model.addAttribute("c_number", c_number);
			model.addAttribute("t_number", t_number);
			model.addAttribute("userId", (String) session.getAttribute("userId"));
			return "eduinfo/stuTaskInsert";
		}
		
		
		//학생 과제 등록
		@PostMapping("/student/task")
		public String insertStuTask(StuTaskVO vo, Model model) throws IllegalStateException, IOException {
			
			
			// 파일 처리 로직
		       MultipartFile file = vo.getUploadFile();
		       if (file != null && !file.isEmpty()) {
		           // 파일 저장 경로 설정
		           String uploadPath = "/resources/upfile/"; // 저장할 경로 설정
		           String fileName = file.getOriginalFilename();
		           
		           // 파일을 해당 경로에 저장
		           File dest = new File(uploadPath + fileName);
		           file.transferTo(dest);
		           
		           // StuTaskVO에 파일 경로 설정
		           vo.setS_file1(uploadPath + fileName); // 파일 경로를 BoardVO의 b_file1에 설정

		           System.out.println("파일 저장 성공: " + fileName);
		       } else {
		           System.out.println("파일이 업로드되지 않았습니다.");
		       }
			
		       eduinfoService.insertStuTaskTx(vo);
		       
		       
		       model.addAttribute("t_number", vo.getT_number());
		       model.addAttribute("id", vo.getId());
			return "redirect:/task/info";
		}
		
		
		//과제 완료 여부 표시
		@GetMapping("/task/check")
		@ResponseBody
		public String checkTask(@RequestParam ("t_number") int t_number, HttpSession session) {
			StuTaskVO stutask = eduinfoService.getStuTask(t_number, (String) session.getAttribute("userId"));
			if (stutask == null) {
		        return "no"; 
		    }else {
			return "yes";
		    }
		}
		
		//해당 과제를 제출한 학생들 리스트
		@GetMapping("/task/students")
		public String taskAllList(@RequestParam ("t_number") int t_number,int c_number, StuTaskVO vo, Model model) {
		
			List<StuTaskVO> stutaskList = eduinfoService.taskAllList(t_number, c_number);
			
			
			//강의 정보
			ClassVO classvo = eduinfoService.classSelect(c_number);			

			model.addAttribute("stutaskList", stutaskList);
			model.addAttribute("c_number", c_number);
			model.addAttribute("c_name", classvo.getC_name());
			model.addAttribute("t_number", t_number);
			
			return "eduinfo/taskAllList";
		}
		
		
		//과제 게시글 수정 페이지
		@GetMapping("/student/taskpage")
		public String stuTaskUpdatePage(@RequestParam ("st_number") int st_number, Model model) {
			
			StuTaskVO stutask = eduinfoService.getThisStuTask(st_number);
			
			//강의 정보
			ClassVO classvo = eduinfoService.classSelect(stutask.getC_number());			
			model.addAttribute("stutask" , stutask);
//			System.out.println(stutask);
			model.addAttribute("c_number", stutask.getC_number());
			model.addAttribute("c_name", classvo.getC_name());
			model.addAttribute("id", stutask.getId());
			
			return "eduinfo/stuTaskUpdate";
		}
		
		//과제 게시글 수정
		@PutMapping("/student/task")
		public String stuTaskUpdate(StuTaskVO vo, Model model) {
			eduinfoService.stuTaskUpdateTx(vo);
			
			model.addAttribute("t_number", vo.getT_number());
			model.addAttribute("id", vo.getId());

			
			return "redirect:/task/info";
		}
	
}
