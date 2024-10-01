package com.smart.view.controller;

import java.security.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.smart.lms.service.EduinfoService;
import com.smart.lms.util.Pagination;
import com.smart.lms.vo.AttendClassVO;
import com.smart.lms.vo.ClassVO;
import com.smart.lms.vo.GradeVO;
import com.smart.lms.vo.ProfessorVO;
import com.smart.lms.vo.StudentVO;
import com.smart.lms.vo.TaskVO;
import com.smart.lms.vo.TestVO;
import com.smart.lms.vo.TodateVO;

@Controller
public class EduinfoController {
	@Autowired
	private EduinfoService eduinfoService;
	
	
	//출석부 -> classList 받아오기
	@GetMapping("/classList")
	public String classList(HttpSession session, Model model, ClassVO vo) {
		vo.setC_id((String) session.getAttribute("userId"));
		List<ClassVO> cList = new ArrayList<ClassVO>();
		cList = eduinfoService.classList(vo);
		model.addAttribute("classList" , cList );
		model.addAttribute("classListcnt", cList.size());
		return "eduinfo/classList";
	}

	//출석페이지
	@GetMapping("/todate")
	public String getUserList( Pagination pg, Model model, HttpSession session) {
	
		model.addAttribute("attendanceList", eduinfoService.attendanceList(pg));
		
		return "eduinfo/todate";
	}
	
	//출석페이지 검색 아작스
	@GetMapping("/attendSearch")
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
	@PostMapping("/insertAttendance")
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
		                    return "redirect:/todate";
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
				
				return "redirect:classList";
				
			} catch (Exception e) {
				e.printStackTrace();
				redirectAttributes.addFlashAttribute("msg", "fail");
				return "redirect:classList";
			}
	}
	
	//출석 상태 변경
	@PutMapping("/updateAttendance")
	@ResponseBody
	public ResponseEntity<TodateVO> updateAttendance(@RequestBody TodateVO vo) throws Exception {
			int cnt = eduinfoService.updateAttendanceTx(vo);
			if(cnt > 0) {
				return new ResponseEntity<>(vo, HttpStatus.OK);
			}
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
	}
	
	//강의 등록 페이지 이동
	@GetMapping("/classInsertPage")
	public String classInsertPage() {
		return "eduinfo/classInsert";
	}
	
	//강의등록
	@PostMapping("/classInsert")
	public String classInsert(ClassVO vo) throws Exception {
		eduinfoService.classInsertTx(vo);
		return "member/adminPage";
	}
	
	//관리자 전체 강의 목록
	@GetMapping("/classAllList")
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
	@GetMapping("/classInfo")
	public ResponseEntity<ClassVO> classInfo(int c_number) {
		ClassVO vo = eduinfoService.classSelect(c_number);
		
		if (vo != null) {
			return new ResponseEntity<>(vo, HttpStatus.OK);
		} else {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
	}
		
	//관리자 강의 정보 수정
	@PutMapping("/classUpdate")
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
	@GetMapping("/attendance")
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
	@GetMapping("/stuList")
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
	@GetMapping("/stuInfo")
	public ResponseEntity<StudentVO> stuInfo(String id) {
		
		StudentVO vo = eduinfoService.stuInfo(id);
		
		if (vo != null) {
			return new ResponseEntity<>(vo, HttpStatus.OK);
		} else {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
	}
	
	//관리자 교수 리스트 불러오기 
	@GetMapping("/proList")
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
	@GetMapping("/proInfo")
	public ResponseEntity<ProfessorVO> proInfo(String id) {
		
		ProfessorVO vo = eduinfoService.proInfo(id);
		if (vo != null) {
			return new ResponseEntity<>(vo, HttpStatus.OK);
		} else {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
	}
	
	//관리자 수강학생 정보 불러오기 
	@GetMapping("/attInfo")
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
		@GetMapping("/attStuSearch")
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
		@GetMapping("/testclassList")
				public String testclassList(HttpSession session, Model model, ClassVO vo) {
					vo.setC_id((String) session.getAttribute("userId"));
					List<ClassVO> cList = new ArrayList<ClassVO>();
					cList = eduinfoService.classList(vo);
					model.addAttribute("classList" , cList );
					model.addAttribute("classListcnt", cList.size());
					return "eduinfo/testclassList";
				}
		
		//시험 정보 등록 페이지 이동
		@GetMapping("/testInsertPage")
		public String testInsertPage(int c_number) {
			return "eduinfo/testInsert";
		}
		
		//시험 정보 INSERT
		@PostMapping("/testInsert")
		public String testInsertTx(@ModelAttribute TestVO vo, HttpServletRequest request, RedirectAttributes redirectAttributes,HttpSession session) throws Exception {
			vo.setId((String) session.getAttribute("userId"));	
			int cnt = eduinfoService.testInsertTx(vo);
				if(cnt > 0) {
					redirectAttributes.addFlashAttribute("msg", "success");
					return "redirect:testclassList";
				}else {
					redirectAttributes.addFlashAttribute("msg", "fail");
					return "redirect:testclassList";
				}
		}
		
		//성적 등록 -> classList 받아오기
		@GetMapping("/gradeclassList")
		public String gradeclassList(HttpSession session, Model model, ClassVO vo) {
			vo.setC_id((String) session.getAttribute("userId"));
			List<ClassVO> cList = new ArrayList<ClassVO>();
			cList = eduinfoService.classList(vo);
			model.addAttribute("classList" , cList );
			model.addAttribute("classListcnt", cList.size());
			return "eduinfo/gclassList";
		}
		
		//성적 등록 -> 시험 목록 선택 페이지
		@GetMapping("/testSelect")
		public String testSelect(Model model, @ModelAttribute TestVO vo, @RequestParam ("c_number") int c_number) {
			vo.setC_number(c_number);
			
			List<TestVO> tList = new ArrayList<TestVO>();
			tList = eduinfoService.testSelect(vo);
			System.out.println("tList " + tList);
			
			model.addAttribute("tList", tList);
			model.addAttribute("testListcnt", tList.size());
			return "eduinfo/testList";
		}
		
		//성적 등록 -> 시험 목록 선택 페이지 -> 성적 등록(수강생 목록 불러옴)
		@GetMapping("/grade")
		public String gradeStuList(Pagination pg, Model model) {
			
			model.addAttribute("gradeStuList", eduinfoService.attendanceList(pg));
			
			return "eduinfo/gradeInsert";
		}
				
		//성적 테이블에 INSERT
		@PostMapping("/insertGrade")
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
					
					return "redirect:/gradeclassList2";
					
				} catch (Exception e) {
					e.printStackTrace();
					redirectAttributes.addFlashAttribute("msg", "fail");
					return "redirect:/gradeclassList";
				}
		}
		
		//교수 강의 리스트 -> 성적 조회/수정으로 연결 
		@GetMapping("/gradeclassList2")
		public String gradeclassList2(HttpSession session, Model model, ClassVO vo) {
			vo.setC_id((String) session.getAttribute("userId"));
			List<ClassVO> cList = new ArrayList<ClassVO>();
			cList = eduinfoService.classList(vo);
			model.addAttribute("classList" , cList );
			model.addAttribute("classListcnt", cList.size());
			return "eduinfo/gclassList2";
		}
		
		//성적 조회/수정 -> 시험 목록 선택 페이지
		@GetMapping("/gradeUpdatePage")
		public String testSelectUpdate(Model model, @ModelAttribute TestVO vo) {
			List<TestVO> tList = new ArrayList<TestVO>();
			tList = eduinfoService.testSelectUp(vo);
			model.addAttribute("tList", tList);
			model.addAttribute("testListcnt", tList.size());
			return "eduinfo/gradeUpdatePage";
		}
		
		//교수 성적 조회/수정 (수강생 목록 불러옴)
		@GetMapping("/gradeList")
		public String gradeList(@ModelAttribute Pagination pg, Model model) {
			
			model.addAttribute("gradeList", eduinfoService.gradeList(pg));
			
			return "eduinfo/gradeList";
		}
		
		//관리자 성적 등급 수정
		@PutMapping("/gradeUpdate")
		@ResponseBody
		public ResponseEntity<GradeVO> gradeUpdate(@RequestBody GradeVO vo) throws Exception {
			int cnt = eduinfoService.gradeUpdateTx(vo);
			if(cnt > 0 ) {
				return new ResponseEntity<>(vo, HttpStatus.OK);
			}else {
				return new ResponseEntity<>(HttpStatus.NOT_FOUND);
			}
		}
		//관리자 성적 수강생 검색  
		@GetMapping("/gradeSearch")
		@ResponseBody
		public Map<String, Object> gradeSearch(@ModelAttribute Pagination pg) {
			List<GradeVO> gradeList = eduinfoService.gradeList(pg);
			Map<String, Object> gList = new HashMap<String, Object>();
			int length = gradeList.size();
			gList.put("gradeList", gradeList);
			gList.put("length", length);
			return gList;
		}
		
		
		//과제 페이지 이동
		@GetMapping("/taskListPage")
		public String taskListPage(@RequestParam ("c_number") int c_number, Model model) {
			
			System.out.println("강의 번호 " + c_number);
			model.addAttribute("c_number" , c_number);
			return "/member/taskIndex";
		}
		
		//마감일이 지나지않은 과제 목록
		@GetMapping("/taskList")
		public String taskList(@RequestParam ("c_number") int c_number, Model model) {
			model.addAttribute("taskList", eduinfoService.getTaskList(c_number));
			return "eduinfo/taskList";
		}
		
		//과제 등록 페이지 이동
		@GetMapping("/taskInsertPage")
			public String taskInsertPage() {
				return "eduinfo/taskInsert";
			}
		
		//과제 등록
		@PostMapping("/taskInsert")
		public String taskInsert(TaskVO vo) {
			eduinfoService.taskInsertTx(vo);
			return "eduinfo/taskInsert";
		}
		
		//과제등록 -> classList 받아오기
		@GetMapping("/taskclassList")
		public String taskclassList(@RequestParam ("status") String status,  HttpSession session, Model model, ClassVO vo) {
			vo.setC_id((String) session.getAttribute("userId"));
			List<ClassVO> cList = new ArrayList<ClassVO>();
			cList = eduinfoService.classList(vo);
			model.addAttribute("classList" , cList );
			model.addAttribute("classListcnt", cList.size());
			model.addAttribute("status" , status);
			
			return "eduinfo/taskclassList";
		}
		
		
		//성적 등록 -> 시험 목록 선택 페이지
//				@GetMapping("/testSelectStu")
//				public String testSelectStu(@RequestParam ("c_number") int c_number,  Model model, @ModelAttribute TestVO vo) {
//					System.out.println("vo " + vo);
//					vo.setC_number(c_number);
//					
//					List<TestVO> tList = eduinfoService.testSelect(vo);
//					System.out.println("tList " + tList);
//					
//					model.addAttribute("tList", tList);
//					model.addAttribute("testListcnt", tList.size());
//					return "eduinfo/testList";
//				}
//		
		//과제 목록 선택 페이지
		@GetMapping("/taskSelectStu")
		public String taskSelect(Model model, @RequestParam ("c_number") int c_number) {
			List<TaskVO> taskList = new ArrayList<TaskVO>();
			taskList = eduinfoService.getTaskList(c_number);
			
			System.out.println("taskList " + taskList);
			model.addAttribute("taskList", taskList);
			model.addAttribute("taskListcnt", taskList.size());
			return "eduinfo/taskList";
		}
		
		
		//과제를 제출한 학생 목록
		@GetMapping("/stuTaskList")
		public String stuTaskList(@RequestParam ("c_number") int c_number, @RequestParam ("t_number") int t_number, Model model) {
			
			
			return null;
			
		}
		
	
}
