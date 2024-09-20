package com.smart.view.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
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
import com.smart.lms.vo.ClassVO;
import com.smart.lms.vo.StudentVO;
import com.smart.lms.vo.TodateVO;

@Controller
public class EduinfoController {
	@Autowired
	private EduinfoService eduinfoService;
	
	
	//classList 받아오기
	@GetMapping("/classList")
	public String classList(HttpSession session, Model model, ClassVO vo) {
		vo.setC_id((String) session.getAttribute("userId"));
		List<ClassVO> cList = new ArrayList<ClassVO>();
		cList = eduinfoService.classList(vo);
		model.addAttribute("classList" , cList );
		model.addAttribute("classListcnt", cList.size());
		return "eduinfo/classList";
	}
	
	//교수 출석부 페이지 이동
	@GetMapping("/attendancePage")
	public String attendance(@RequestParam(value = "c_number", required = false) int c_number,
			 //@RequestParam("a_date") Date a_date, 
			 HttpSession session) {
		session.setAttribute("c_number", c_number);
		// session.setAttribute("a_date", a_date);
		return "redirect:/attendance";
	}
	
	//출석페이지
	@GetMapping("/attendance")
	public String getUserList(@ModelAttribute Pagination pg, Model model, HttpSession session) {

		int currPageNo = pg.getCurrPageNo();
		int range = pg.getRange();
		pg.setC_number((int)session.getAttribute("c_number"));

		int totalCnt = eduinfoService.attendanceTotalCnt(pg);

		pg.pageInfo(currPageNo, range, totalCnt);

		model.addAttribute("pagination", pg);
		model.addAttribute("attendanceList", eduinfoService.attendanceList(pg));
		
		
		/*
		 * int toCnt = eduinfoService.toCnt((Date) session.getAttribute("a_date"));
		 * if(toCnt > 0) { model.addAttribute("todateList",
		 * eduinfoService.getTodate(pg)); }
		 */
		 
		
		return "eduinfo/attendance";
	}
	
	//출석부 테이블에 INSERT
	@PostMapping("/insertAttendance")
	public String insertAttendanceTx(TodateVO vo, HttpServletRequest request, RedirectAttributes redirectAttributes, HttpSession session) {
		try {
		 Enumeration<String> pname = request.getParameterNames();
		 List<TodateVO> toList = new ArrayList<>();
		 int c_number = vo.getC_number();
		// Date a_date = (Date) session.getAttribute("a_date");
		 Date a_date = vo.getA_date();
		    
		    while (pname.hasMoreElements()) { 
		        String paramName = pname.nextElement(); 
		        String id = "";
		        
		        if (paramName.startsWith("id_")) {
		             id = request.getParameter(paramName); 
		             String status = request.getParameter("a_status_" + id);
		             
		             if (id == null || status == null || a_date == null) {
		                    redirectAttributes.addFlashAttribute("msg", "null");
		                    return "redirect:/attendance";
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
				
				return "redirect:/attendance";
				
			} catch (Exception e) {
				e.printStackTrace();
				redirectAttributes.addFlashAttribute("msg", "fail");
				return "redirect:/attendance";
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
	@GetMapping("/classPage")
	public String classPage(int c_number, Model model) {
		
		model.addAttribute("classSelect", eduinfoService.classSelect(c_number));
		return "eduinfo/classSelect";
	}
	
	//관리자 강의 정보 수정
	@PutMapping("/classUpdate")
	public String classUpdate(ClassVO vo, RedirectAttributes redirectAttributes) throws Exception {
		int c_number = vo.getC_number();
		int cnt = eduinfoService.classUpdateTx(vo);
		if(cnt > 0 ) {
			 redirectAttributes.addFlashAttribute("success", true);
			 return "redirect:/classPage?c_number=" + c_number;
		}else {
			redirectAttributes.addFlashAttribute("success", false);
		}
		return "redirect:/classAllList";
	}
	
	//classList 받아오기 메소드 하나로 사용 -> 전체데이터 받아오고 화면단에서 id로 수정하기 or 메소드 새로 생성하기 
	@GetMapping("/attendSelect")
	public String attendSelect(HttpSession session, Model model, ClassVO vo) {
		List<ClassVO> cList = new ArrayList<ClassVO>();
		cList = eduinfoService.classList(vo);
		model.addAttribute("classList" , cList );
		model.addAttribute("classListcnt", cList.size());
		return "eduinfo/attendSelect";
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
		System.out.println(vo);
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
	
}
