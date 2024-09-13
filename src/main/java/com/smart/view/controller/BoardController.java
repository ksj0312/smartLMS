package com.smart.view.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.smart.lms.service.BoardService;
import com.smart.lms.service.MemberService;
import com.smart.lms.util.ExcelUtil;
import com.smart.lms.vo.StudentVO;

import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	//엑셀 업로드 페이지 이동
    @GetMapping("/uploadPage")
    public String showUploadPage() {
        return "/board/excelPage";  
    }
    
    //엑셀 파일 다운로드
    @GetMapping("/download/excel")
    public ResponseEntity<byte[]> downloadExcel() {
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
            header.createCell(13).setCellValue("졸업일(1999.01.01)");
            header.createCell(14).setCellValue("상태(재학, 휴학, 퇴학, 졸업");

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
    
    //엑셀 파일 업로드 , 데이터 베이스에 저장
    @PostMapping("/upload/excel")
    public String uploadExcelFile(@RequestParam("file") MultipartFile file, RedirectAttributes redirectAttributes) {
        try {
            InputStream inputStream = file.getInputStream();
            Workbook workbook = WorkbookFactory.create(inputStream);
            Sheet sheet = workbook.getSheetAt(0);

            List<StudentVO> students = new ArrayList<>();
            System.out.println(sheet.getLastRowNum());
            
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
            	Cell graduation_dateCell = row.getCell(13);
            	String status = ExcelUtil.getCellValue(row.getCell(14));
            	
                Date admission_date = null;
                Date graduation_date = null;

                if (admission_dateCell != null && admission_dateCell.getCellType() == CellType.NUMERIC && DateUtil.isCellDateFormatted(admission_dateCell)) {
                    admission_date = new Date(admission_dateCell.getDateCellValue().getTime());
                }

                if (graduation_dateCell != null && graduation_dateCell.getCellType() == CellType.NUMERIC && DateUtil.isCellDateFormatted(graduation_dateCell)) {
                    graduation_date = new Date(graduation_dateCell.getDateCellValue().getTime());
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
                student.setGraduation_date(graduation_date);
                student.setStatus(status);

                students.add(student);
            }
            memService.insertStudent(students);

            workbook.close();
            redirectAttributes.addFlashAttribute("success", true);
            return "redirect:/uploadPage";
        
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("success", false);
            return "redirect:/uploadPage"; 
        }
    }


}
