package com.smart.view.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.smart.lms.service.BoardService;
import com.smart.lms.service.MemberService;
import com.smart.lms.util.ExcelUtil;
import com.smart.lms.vo.ProfessorVO;
import com.smart.lms.vo.StudentVO;
import com.smart.lms.vo.BoardVO;

import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.IOException;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;

import java.util.Date;
import java.util.ArrayList;
import java.util.List;


@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private MemberService memService;
	
	//학생 엑셀 업로드 페이지 이동
    @GetMapping("/uploadPageStu")
    public String uploadPageStu() {
        return "/board/excelPageStu";  
    }
    
    //교수 엑셀 업로드 페이지 이동
    @GetMapping("/uploadPagePro")
    public String uploadPagePro() {
    	return "/board/excelPagePro";  
    }
    
    //학생용 엑셀 파일 다운로드
    @GetMapping("/download/excelStu")
    public ResponseEntity<byte[]> downloadExcelStu() {
        try (Workbook workbook = new XSSFWorkbook()) {
            Sheet sheet = workbook.createSheet("Students");

            Row header = sheet.createRow(0);
            header.createCell(0).setCellValue("아이디" + " *중복불가");
            header.createCell(1).setCellValue("비밀번호");
            header.createCell(2).setCellValue("이름");
            header.createCell(3).setCellValue("성별(남/여)");
            header.createCell(4).setCellValue("생일(1999.01.01)");
            header.createCell(5).setCellValue("전화번호(010-1111-1111)");
            header.createCell(6).setCellValue("우편번호");
            header.createCell(7).setCellValue("주소");
            header.createCell(8).setCellValue("상세주소");
            header.createCell(9).setCellValue("이메일");
            header.createCell(10).setCellValue("학과");
            header.createCell(11).setCellValue("학년(ex: 1학년)");
            header.createCell(12).setCellValue("입학일(1999.01.01)");
            header.createCell(13).setCellValue("상태(재학, 휴학, 퇴학, 졸업");

            Row ex = sheet.createRow(1);
            ex.createCell(0).setCellValue("아이디, 비밀번호, 전화번호, 우편번호는 셀 형식을 텍스트 형식으로 맞춰주세요.");
            
            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            workbook.write(outputStream);

            byte[] excelContent = outputStream.toByteArray();
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
            headers.set(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=students.xlsx");

            return ResponseEntity.ok()
                    .headers(headers)
                    .body(excelContent);

        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).build();
        }
    }
    
    //학생용 엑셀 파일 업로드 , 데이터 베이스에 저장
    @PostMapping("/upload/excelStu")
    public String uploadExcelFileStu(@RequestParam("file") MultipartFile file, RedirectAttributes redirectAttributes) {
        try {
            InputStream inputStream = file.getInputStream();
            Workbook workbook = WorkbookFactory.create(inputStream);
            Sheet sheet = workbook.getSheetAt(0);

            List<StudentVO> students = new ArrayList<>();
            
            Row firstRow = sheet.getRow(0); 
            int lastCellNum = firstRow.getLastCellNum();
            
            for (int i = 2; i <= sheet.getLastRowNum(); i++) {
//            	for (int i = 2; i < sheet.getPhysicalNumberOfRows(); i++) {
                Row row = sheet.getRow(i);
                
                String id = ExcelUtil.getCellValue(row.getCell(0));
            	String pwd = ExcelUtil.getCellValue(row.getCell(1));
            	String name = ExcelUtil.getCellValue(row.getCell(2));
            	String gender = ExcelUtil.getCellValue(row.getCell(3));
            	String birth = ExcelUtil.getCellValue(row.getCell(4));
            	String tel = ExcelUtil.getCellValue(row.getCell(5));
            	String zipcode = ExcelUtil.getCellValue(row.getCell(6));
            	String addr = ExcelUtil.getCellValue(row.getCell(7));
            	String detail_addr = ExcelUtil.getCellValue(row.getCell(8));
            	String email = ExcelUtil.getCellValue(row.getCell(9));
            	String department = ExcelUtil.getCellValue(row.getCell(10));
            	String grade = ExcelUtil.getCellValue(row.getCell(11));
            	Cell admission_dateCell  = row.getCell(12);
            	String status = ExcelUtil.getCellValue(row.getCell(13));
            	
                Date admission_date = null;
                Date graduation_date = null;

                if (admission_dateCell != null && admission_dateCell.getCellType() == CellType.NUMERIC && DateUtil.isCellDateFormatted(admission_dateCell)) {
                    admission_date = new Date(admission_dateCell.getDateCellValue().getTime());
                }

                StudentVO student = new StudentVO();
                student.setId(id);
                student.setPwd(pwd);
                student.setName(name);
                student.setGender(gender);
                student.setBirth(birth);
                student.setTel(tel);
                student.setZipcode(zipcode);
                student.setAddr(addr);
                student.setDetail_addr(detail_addr);
                student.setEmail(email);
                student.setDepartment(department);
                student.setGrade(grade);
                student.setAdmission_date(admission_date);
                student.setStatus(status);

                students.add(student);
            }
            
            if(students.size() > 0 && lastCellNum == 14) {
            	memService.insertStudentTx(students);
            }
            
            redirectAttributes.addFlashAttribute("success", lastCellNum == 14);

            workbook.close();
            return "redirect:/uploadPageStu";
        
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("success", false);
            return "redirect:/uploadPageStu"; 
        }
    }
    
    //교수용 엑셀 파일 다운로드
    @GetMapping("/download/excelPro")
    public ResponseEntity<byte[]> downloadExcelPro() {
        try (Workbook workbook = new XSSFWorkbook()) {
            Sheet sheet = workbook.createSheet("Professors");
        	
            Row header = sheet.createRow(0);
            header.createCell(0).setCellValue("아이디" + " *중복불가");
            header.createCell(1).setCellValue("비밀번호");
            header.createCell(2).setCellValue("이름");
            header.createCell(3).setCellValue("성별(남/여)");
            header.createCell(4).setCellValue("생일(1999.01.01)");
            header.createCell(5).setCellValue("전화번호(010-1111-1111)");
            header.createCell(6).setCellValue("우편번호");
            header.createCell(7).setCellValue("주소");
            header.createCell(8).setCellValue("상세주소");
            header.createCell(9).setCellValue("이메일");
            header.createCell(10).setCellValue("과목");
            header.createCell(11).setCellValue("상태(재직, 휴직, 은퇴)");
            header.createCell(12).setCellValue("입사일(1999.01.01)");

            Row ex = sheet.createRow(1);
            ex.createCell(0).setCellValue("아이디, 비밀번호, 전화번호, 우편번호는 셀 형식을 텍스트 형식으로 맞춰주세요.");
            
            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            workbook.write(outputStream);

            byte[] excelContent = outputStream.toByteArray();
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
            headers.set(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=professors.xlsx");

            return ResponseEntity.ok()
                    .headers(headers)
                    .body(excelContent);

        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).build();
        }
    }
    
    //교수용 엑셀 파일 업로드 , 데이터 베이스에 저장
    @PostMapping("/upload/excelPro")
    public String uploadExcelFile(@RequestParam("file") MultipartFile file, RedirectAttributes redirectAttributes) {
        try {
            InputStream inputStream = file.getInputStream();
            Workbook workbook = WorkbookFactory.create(inputStream);
            Sheet sheet = workbook.getSheetAt(0);

            List<ProfessorVO> professors = new ArrayList<>();
            Row firstRow = sheet.getRow(0); 
            int lastCellNum = firstRow.getLastCellNum();
            
            for (int i = 2; i <= sheet.getLastRowNum(); i++) {
//            	for (int i = 2; i < sheet.getPhysicalNumberOfRows(); i++) {
                Row row = sheet.getRow(i);
            
                String id = ExcelUtil.getCellValue(row.getCell(0));
            	String pwd = ExcelUtil.getCellValue(row.getCell(1));
            	String name = ExcelUtil.getCellValue(row.getCell(2));
            	String gender = ExcelUtil.getCellValue(row.getCell(3));
            	String birth = ExcelUtil.getCellValue(row.getCell(4));
            	String tel = ExcelUtil.getCellValue(row.getCell(5));
            	String zipcode = ExcelUtil.getCellValue(row.getCell(6));
            	String addr = ExcelUtil.getCellValue(row.getCell(7));
            	String detail_addr = ExcelUtil.getCellValue(row.getCell(8));
            	String email = ExcelUtil.getCellValue(row.getCell(9));
            	String lesson = ExcelUtil.getCellValue(row.getCell(10));
            	String status = ExcelUtil.getCellValue(row.getCell(11));
            	Cell indateCell = row.getCell(12);
            	
                Date indate = null;

                if (indateCell != null && indateCell.getCellType() == CellType.NUMERIC && DateUtil.isCellDateFormatted(indateCell)) {
                	indate = new Date(indateCell.getDateCellValue().getTime());
                }
                
                ProfessorVO professor = new ProfessorVO();
                
                professor.setId(id);
                professor.setPwd(pwd);
                professor.setName(name);
                professor.setGender(gender);
                professor.setBirth(birth);
                professor.setTel(tel);
                professor.setZipcode(zipcode);
                professor.setAddr(addr);
                professor.setDetail_addr(detail_addr);
                professor.setEmail(email);
                professor.setLesson(lesson);
                professor.setStatus(status);
                professor.setIndate(indate);
                System.out.println(professor.getIndate());

                professors.add(professor);
            }
            System.out.println(professors);
            
            
            if(professors.size() > 0 && lastCellNum == 13) {
            	memService.insertProfessorTx(professors);
            }
            
            redirectAttributes.addFlashAttribute("success", lastCellNum == 13);

            workbook.close();
            return "redirect:/uploadPagePro";
        
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("success", false);
            return "redirect:/uploadPagePro"; 
        }
    }

	//게시판 목록
	@RequestMapping("/getBoardList")
	public ModelAndView getBoardList(BoardVO vo, ModelAndView mav) {
		List<BoardVO> boardList = boardService.getBoardList(vo);
		mav.addObject("boardList", boardList);
		mav.setViewName("/board/board");
		return mav;
	}
	
	//게시글 등록 페이지 이동
	@RequestMapping("/insertPage")
	public String insertPage() {
		return "/board/insertboard";
	}
	
	//게시글 등록 후 목록 페이지 이동
	@PostMapping(value = "/insertBoard")
	public String insertBoard(@ModelAttribute BoardVO vo) throws IllegalStateException, IOException {
		boardService.insertBoard(vo);
		if(vo.getB_type().equals("게시판")) {
			return "redirect:/getBoardList?b_type=게시판";
		}else {
			
			return "redirect:/getBoardList?b_type=QNA";
		}
		
	}
	
	//목록 누를시 상세 내용으로 이동
	@RequestMapping("/getBoard")
	public String getBoard(BoardVO vo, Model model) {
		BoardVO board = boardService.getBoard(vo);
		model.addAttribute("board", board);
		return "/board/boarddetail";
	}
	
	
	//선택 목록 삭제
	@RequestMapping("/deleteBoard")
	public String deleteBoard(BoardVO vo) {
		boardService.deleteBoard(vo);
		return "redirect:/getBoardList";
	}
	
	//수정 누를 시 수정페이지로 이동
	@RequestMapping("/updatePage")
	public String updatePage(BoardVO vo, Model model) {
		BoardVO board = boardService.getBoard(vo);
		model.addAttribute("board", board);
		return "/board/updateboard";
	}
	

	//선택 목록 수정
	@PostMapping("/updateBoard")
	public String updateBoard(@ModelAttribute BoardVO vo) {
		boardService.updateBoard(vo);
		return "redirect:/getBoard?b_number=" + vo.getB_number();
	}
	
}
