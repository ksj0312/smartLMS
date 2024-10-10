package com.smart.view.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.smart.lms.service.BoardService;
import com.smart.lms.service.EduinfoService;
import com.smart.lms.service.MemberService;
import com.smart.lms.util.ExcelUtil;
import com.smart.lms.util.Pagination;
import com.smart.lms.vo.BoardVO;
import com.smart.lms.vo.CalendarVO;
import com.smart.lms.vo.CommentVO;
import com.smart.lms.vo.NoteVO;
import com.smart.lms.vo.ProfessorVO;
import com.smart.lms.vo.StudentVO;

@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;
	@Autowired
	private MemberService memService;
	@Autowired
	private EduinfoService eduinfoService;

	@PostMapping("/sendnote")
	@ResponseBody
	public void sendNote(@RequestParam("n_sender") String n_sender, @RequestParam("n_reciver") String n_reciver,
			@RequestParam("n_title") String n_title, @RequestParam("n_info") String n_info) throws Exception {
		boardService.sendNoteTx(n_sender, n_reciver, n_title, n_info);

	}
	
	@GetMapping("/sendlistsearch")
	@ResponseBody
	public Map<String, Object> sendListSearch(@RequestParam("page") int page,@RequestParam("search") String search, @RequestParam("size") int size,@RequestParam("userId") String userId){
		int start = (page - 1) * size; // 페이징의 시작 인덱스
		List<NoteVO> sendListSearch = boardService.sendListSearch(start, size, userId, search); // 페이징된 리스트 가져오기
		int totalCnt = boardService.getSearchTotalNoteCount2(search, userId); // 전체 노트 개수
		int totalPages = (int) Math.ceil((double) totalCnt / size);
		
		Map<String, Object> searchresult = new HashMap<>();
		searchresult.put("notes", sendListSearch);
		searchresult.put("prev", page > 1);
		searchresult.put("next", totalCnt > page * size);
		searchresult.put("totalCnt", totalCnt);
		searchresult.put("totalPages", totalPages);
		return searchresult;
	}
	
	@GetMapping("/sendlist")
	@ResponseBody
	public Map<String, Object> sendList(@RequestParam("page") int page, @RequestParam("size") int size,
			@RequestParam("userId") String userId) {
		int start = (page - 1) * size; // 페이징의 시작 인덱스
		List<NoteVO> receivNote = boardService.sendList(start, size, userId); // 페이징된 리스트 가져오기
		int totalCnt = boardService.getTotalNoteCount2(userId); // 전체 노트 개수
		int totalPages = (int) Math.ceil((double) totalCnt / size);
		
		Map<String, Object> result = new HashMap<>();
		result.put("notes", receivNote);
		result.put("prev", page > 1); // 이전 페이지 여부
		result.put("next", totalCnt > page * size); // 다음 페이지 여부
		result.put("totalCnt", totalCnt); // 전체 노트 수
		result.put("totalPages", totalPages);
		return result;
	}
	
	@GetMapping("/menual")
	public String menual() {
		return "board/menual";
	}

	@GetMapping("/checkUser")
	@ResponseBody
	public boolean checkUser(@RequestParam("n_reciver") String n_reciver) {
		boolean userExists = boardService.checkUser(n_reciver) || boardService.checkUserAdmin(n_reciver); // boardService가 boolean 반환
		System.out.println("User exists: " + userExists);
		return userExists; // 유저가 존재하면 true, 없으면 false 반환
	}

	@GetMapping("/receivnote")
	@ResponseBody
	public Map<String, Object> receivNote(@RequestParam("page") int page, @RequestParam("size") int size,
			@RequestParam("userId") String userId) {
		int start = (page - 1) * size; // 페이징의 시작 인덱스
		List<NoteVO> receivNote = boardService.getNotesWithPagination(start, size, userId); // 페이징된 리스트 가져오기
		int totalCnt = boardService.getTotalNoteCount(userId); // 전체 노트 개수

		// 전체 페이지 수 계산
		int totalPages = (int) Math.ceil((double) totalCnt / size);

		Map<String, Object> result = new HashMap<>();
		result.put("notes", receivNote);
		result.put("prev", page > 1); // 이전 페이지 여부
		result.put("next", totalCnt > page * size); // 다음 페이지 여부
		result.put("totalCnt", totalCnt); // 전체 노트 수
		result.put("totalPages", totalPages);
		System.out.println(result);
		return result;
	}

	@GetMapping("/searchnote")
	@ResponseBody
	public Map<String, Object> searchNote(@RequestParam("page") int page, @RequestParam("size") int size,
			@RequestParam("search") String search, @RequestParam("userId") String userId) {
		int start = (page - 1) * size; // 페이징의 시작 인덱스
		List<NoteVO> searchNote = boardService.getSearchNotesWithPagination(start, size, search, userId);
		int totalCnt = boardService.getTotalSearchNoteCount(search, userId);

		int totalPages = (int) Math.ceil((double) totalCnt / size);

		Map<String, Object> searchresult = new HashMap<>();
		searchresult.put("notes", searchNote);
		searchresult.put("prev", page > 1);
		searchresult.put("next", totalCnt > page * size);
		searchresult.put("totalCnt", totalCnt);
		searchresult.put("totalPages", totalPages);
		return searchresult;
	}

	// 쪽지 보기
	@GetMapping("/detailnote")
	@ResponseBody
	public NoteVO detailNote(@RequestParam String n_number) throws Exception {
		// System.out.println(n_number);
		boardService.updateNoteTx(n_number);
		NoteVO result = boardService.detailNote(n_number);
		return result;
	}

	// 쪽지 삭제하기
	@DeleteMapping("/deletenote")
	@ResponseBody
	public void deleteNote(@RequestParam String n_number) throws Exception {
		System.out.println(n_number);
		boardService.deleteNoteTx(n_number);

	}

	@GetMapping("/go")
	public String go() {
		return "board/note";
	}

	// 학생 엑셀 업로드 페이지 이동
	@GetMapping("/excel/students")
	public String uploadPageStu() {
		return "/board/excelPageStu";
	}

	// 교수 엑셀 업로드 페이지 이동
	@GetMapping("/excel/professors")
	public String uploadPagePro() {
		return "/board/excelPagePro";
	}

	// 학생용 엑셀 파일 다운로드
	@GetMapping("/download/excelStu")
	public ResponseEntity<byte[]> downloadExcelStu() {
		try (Workbook workbook = new XSSFWorkbook()) {
			Sheet sheet = workbook.createSheet("Students");

			Row header = sheet.createRow(0);
			header.createCell(0).setCellValue("아이디" + " *중복불가");
			header.createCell(1).setCellValue("비밀번호" + "*영문자,특수문자,숫자 포함 8글자 이상");
			header.createCell(2).setCellValue("이름");
			header.createCell(3).setCellValue("성별(남/여)");
			header.createCell(4).setCellValue("생일(1999-01-01)");
			header.createCell(5).setCellValue("전화번호(010-1111-1111)");
			header.createCell(6).setCellValue("우편번호");
			header.createCell(7).setCellValue("주소");
			header.createCell(8).setCellValue("상세주소");
			header.createCell(9).setCellValue("이메일");
			header.createCell(10).setCellValue("학과");
			header.createCell(11).setCellValue("학년(ex: 1학년)");
			header.createCell(12).setCellValue("입학일(1999-01-01)");
			header.createCell(13).setCellValue("상태(재학, 휴학, 퇴학, 졸업");

			Row ex = sheet.createRow(1);
			ex.createCell(0).setCellValue("아이디, 비밀번호, 전화번호, 우편번호는 셀 서식을 텍스트 형식으로, 입학일은 날짜로 지정해주세요. 비어있는 행은 삭제해주세요.");

			ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
			workbook.write(outputStream);

			byte[] excelContent = outputStream.toByteArray();
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			headers.set(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=students.xlsx");

			return ResponseEntity.ok().headers(headers).body(excelContent);

		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(500).build();
		}
	}

	// 학생용 엑셀 파일 업로드 , 데이터 베이스에 저장
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
				Cell admission_dateCell = row.getCell(12);
				String status = ExcelUtil.getCellValue(row.getCell(13));

				Date admission_date = null;

				if (admission_dateCell != null && admission_dateCell.getCellType() == CellType.NUMERIC
						&& DateUtil.isCellDateFormatted(admission_dateCell)) {
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

			if (students.size() > 0 && lastCellNum == 14) {
				memService.insertStudentTx(students);
			}

			redirectAttributes.addFlashAttribute("msg", "success");

			workbook.close();
			return "redirect:/excel/students";

		} catch (Exception e) {
			e.printStackTrace();
			redirectAttributes.addFlashAttribute("msg", "fail");
			return "redirect:/excel/students";
		}
	}

	// 교수용 엑셀 파일 다운로드
	@GetMapping("/download/excelPro")
	public ResponseEntity<byte[]> downloadExcelPro() {
		try (Workbook workbook = new XSSFWorkbook()) {
			Sheet sheet = workbook.createSheet("Professors");

			Row header = sheet.createRow(0);
			header.createCell(0).setCellValue("아이디" + " *중복불가");
			header.createCell(1).setCellValue("비밀번호" + "*영문자,특수문자,숫자 포함 8글자 이상");
			header.createCell(2).setCellValue("이름");
			header.createCell(3).setCellValue("성별(남/여)");
			header.createCell(4).setCellValue("생일(1999-01-01)");
			header.createCell(5).setCellValue("전화번호(010-1111-1111)");
			header.createCell(6).setCellValue("우편번호");
			header.createCell(7).setCellValue("주소");
			header.createCell(8).setCellValue("상세주소");
			header.createCell(9).setCellValue("이메일");
			header.createCell(10).setCellValue("과목");
			header.createCell(11).setCellValue("상태(재직, 휴직, 은퇴)");
			header.createCell(12).setCellValue("입사일(1999-01-01)");
			header.createCell(13).setCellValue("타입(관리자/교수)");

			Row ex = sheet.createRow(1);
			ex.createCell(0)
					.setCellValue("아이디, 비밀번호, 전화번호, 우편번호는 셀 서식을 텍스트 형식으로, 입사일은 셀 서식을 날짜로 지정해주세요. 비어있는 행은 삭제해주세요.");

			ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
			workbook.write(outputStream);

			byte[] excelContent = outputStream.toByteArray();
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			headers.set(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=professors.xlsx");

			return ResponseEntity.ok().headers(headers).body(excelContent);

		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(500).build();
		}
	}

	// 교수용 엑셀 파일 업로드 , 데이터 베이스에 저장
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
				String type = ExcelUtil.getCellValue(row.getCell(13));

				Date indate = null;

				if (indateCell != null && indateCell.getCellType() == CellType.NUMERIC
						&& DateUtil.isCellDateFormatted(indateCell)) {
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
				professor.setType(type);
				System.out.println(professor.getIndate());

				professors.add(professor);
			}
			System.out.println(professors);

			if (professors.size() > 0 && lastCellNum == 14) {
				memService.insertProfessorTx(professors);
			}

			redirectAttributes.addFlashAttribute("msg", "success");

			workbook.close();
			return "redirect:/excel/professors";

		} catch (Exception e) {
			e.printStackTrace();
			redirectAttributes.addFlashAttribute("msg", "fail");
			return "redirect:/excel/professors";
		}
	}

	// 교수 리스트 받아오기
	@GetMapping("/professors")
	public String professorsInfo(@ModelAttribute Pagination pg, Model model) {
		int currPageNo = pg.getCurrPageNo();
		int range = pg.getRange();

		int totalCnt = eduinfoService.proAllCnt(pg);

		pg.pageInfo(currPageNo, range, totalCnt);

		model.addAttribute("pagination", pg);
		model.addAttribute("proList2", eduinfoService.proList(pg));
		return "/board/professorsInfo";
	}

	// 관리자 해당 교수 정보 불러오기
	@GetMapping("/professor")
	public ResponseEntity<ProfessorVO> professorInfo(String id) {

		ProfessorVO vo = eduinfoService.proInfo(id);
		if (vo != null) {
			return new ResponseEntity<>(vo, HttpStatus.OK);
		} else {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
	}

	// 메인에 공지사항 가져오기
	@GetMapping("/board/main")
	@ResponseBody
	public Map<String, Object> boardMain(@RequestParam(value = "b_type", defaultValue = "") String b_type) {
		List<BoardVO> boardList = boardService.boardMain(b_type);
		Map<String, Object> bmap = new HashMap<String, Object>();
		bmap.put("board", boardList);
		return bmap;
	}

//  ---------board 컨트롤러

//게시판 목록
	@GetMapping("/board")
	public String getBoardList(@ModelAttribute Pagination pg, Model model, HttpSession session,
			@RequestParam(value = "b_type", defaultValue = "") String b_type) {
		int currPageNo = pg.getCurrPageNo();
		System.out.println(pg.getKeyword());
		int range = pg.getRange();
		pg.setB_type(b_type);
		int totalCnt = boardService.getBoardListTotalCnt(pg);

		pg.pageInfo(currPageNo, range, totalCnt);
		List<BoardVO> boardList = boardService.getBoardList(pg);

		model.addAttribute("pagination", pg);
		model.addAttribute("getBoardList", boardService.getBoardListTotalCnt(pg));
		model.addAttribute("boardList", boardList);
		return "/board/board";
	}

	@GetMapping("/mypage/board")
	public String myPageBoardList(@ModelAttribute Pagination pg, Model model, HttpSession session,
			@RequestParam("b_type") String b_type, @RequestParam("b_id") String b_id) {
		int currPageNo = pg.getCurrPageNo();
		int range = pg.getRange();
		int totalCnt = 0;
		pg.setB_type(b_type);
		pg.setB_id(b_id);
		System.out.println(pg.getB_id());
		totalCnt = boardService.getBoardListTotalCnt(pg);

		pg.pageInfo(currPageNo, range, totalCnt);
		List<BoardVO> boardList = boardService.myPageBoardList(pg);

		model.addAttribute("pagination", pg);
		model.addAttribute("getBoardList", boardService.getBoardListTotalCnt(pg));
		model.addAttribute("boardList", boardList);
		return "/board/myPageBoard";
	}

	// 관리자 게시판 관리 목록
	@GetMapping("/boardadmin")
	public String getBoardListAdmin(@ModelAttribute Pagination pg, Model model, HttpSession session,
			@RequestParam(value = "b_type", defaultValue = "") String b_type) {

		int currPageNo = pg.getCurrPageNo();
		int range = pg.getRange();
		pg.setB_type(b_type);

		int totalCnt = boardService.getBoardListTotalCnt(pg);

		pg.pageInfo(currPageNo, range, totalCnt);
		List<BoardVO> boardList = boardService.getBoardList(pg);

		System.out.println("pg " + pg);
		System.out.println("boardList " + boardList);

		model.addAttribute("pagination", pg);
		model.addAttribute("getBoardList", boardService.getBoardListTotalCnt(pg));
		model.addAttribute("boardList", boardList);
		return "/board/boardAdmin";
	}

	// 게시글 등록 페이지 이동
	@GetMapping("/boardpage")
	public String insertPage(@RequestParam(value = "b_type", defaultValue = "") String b_type, Model model) {
		model.addAttribute("b_type", b_type); // 기본값을 빈 문자열로 설정
		return "/board/insertboard";
	}

	// 상대경로로 수정하기
	// 게시글 등록 후 목록 페이지 이동
	@PostMapping(value = "/board")
	public String insertBoard(@ModelAttribute BoardVO vo) throws IllegalStateException, IOException, Exception {

		System.out.println("VO " + vo);

		// 파일 처리 로직
		MultipartFile file = vo.getUploadFile();
		if (file != null && !file.isEmpty()) {
			// 파일 저장 경로 설정 (상대 경로)
			String uploadPath = "/resources/upfile/"; // 상대 경로 설정
			String fileName = file.getOriginalFilename();

			// 저장할 파일의 전체 경로
			String fullPath = new File(uploadPath).getAbsolutePath() + File.separator + fileName;

			// 파일을 해당 경로에 저장
			File dest = new File(fullPath);
			file.transferTo(dest);

			// BoardVO에 파일 경로 설정 (상대 경로 사용)
			vo.setB_file1(fileName); // 파일 경로를 BoardVO의 b_file1에 설정

			System.out.println("파일 저장 성공: " + fileName);
		} else {
			System.out.println("파일이 업로드되지 않았습니다.");
		}

		boardService.insertBoardTx(vo);

		String btype = "게시판";

		if (vo.getB_type().equals(btype)) {

			return "redirect:/board?b_type=" + URLEncoder.encode(btype, StandardCharsets.UTF_8.toString());
		} else {

			return "redirect:/board?b_type=QNA";
		}

	}

	// 파일 다운로드 로직
	@GetMapping("/downloadFile")
	public void downloadFile(@RequestParam("fileName") String fileName, HttpServletResponse response)
			throws IOException {
		System.out.println(fileName);
		// 파일 저장 경로 설정 (상대 경로)
		String uploadPath = "/resources/upfile/"; // 파일이 저장된 상대 경로
		String filePath = uploadPath + fileName; // 전체 파일 경로 생성
		

		// URL 디코딩 (공백 및 특수문자를 처리하기 위해)
		String decodedFilePath = java.net.URLDecoder.decode(filePath, "UTF-8");

		// 파일 객체 생성
		File file = new File(decodedFilePath);

		if (file.exists()) {
			response.setContentType("application/octet-stream");
			response.setHeader("Content-Disposition", "attachment; filename=\""
					+ URLEncoder.encode(file.getName(), "UTF-8").replaceAll("\\+", "%20") + "\"");
			response.setContentLength((int) file.length());

			try (FileInputStream fis = new FileInputStream(file); OutputStream os = response.getOutputStream()) {
				byte[] buffer = new byte[1024];
				int bytesRead;
				while ((bytesRead = fis.read(buffer)) != -1) {
					os.write(buffer, 0, bytesRead);
				}
				os.flush();
			} catch (IOException e) {
				e.printStackTrace();
				throw new IOException("파일 다운로드 중 오류가 발생했습니다.");
			}
		} else {
			response.sendError(HttpServletResponse.SC_NOT_FOUND, "파일을 찾을 수 없습니다.");
		}
	}

	// 목록 누를시 상세 내용으로 이동
	@GetMapping("/boarddetail")
	public String getBoard(Pagination pg, BoardVO vo, Model model, HttpSession session, String b_type, String b_id, int b_number) {

		// 세션에서 조회한 게시물 번호 확인
		List<Integer> viewedBoards = (List<Integer>) session.getAttribute("viewedBoards");
		
		vo.setB_number(b_number);
		
		pg.setSizePerPage(5);
		int currPageNo = pg.getCurrPageNo();
		int range = pg.getRange();
		pg.setB_type(b_type);
		pg.setB_id(b_id);
		pg.setB_number(vo.getB_number());
		
		int totalCnt =  boardService.getCommentListTotalCnt(vo.getB_number());
		pg.pageInfo(currPageNo,  range,  totalCnt);
		
		// 조회수 1씩 증가 로직
		if (viewedBoards == null) {
			viewedBoards = new ArrayList<>();
		}

		if (!viewedBoards.contains(vo.getB_number())) {
			boardService.boardViewTx(vo.getB_number());
			viewedBoards.add(vo.getB_number());
			session.setAttribute("viewedBoards", viewedBoards);
		}
		

		BoardVO board = boardService.getBoard(vo.getB_number());
		// 댓글 조회
		List<CommentVO> commentList = boardService.getCommentList(pg);

		// timestamp형식으로 가져오는 값 date형식으로 변환
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // YYYY-MM-DD 형식
		String formattedDate = sdf.format(board.getB_create_date());

		for (CommentVO comment : commentList) {
			String formattedDate1 = sdf.format(comment.getCo_create_date());
			comment.setFormat_create_date(formattedDate1); // 새 필드로 저장
		}
		
		model.addAttribute("pagination" , pg);
		model.addAttribute("board", board);
		model.addAttribute("getCommentList", boardService.getCommentListTotalCnt(vo.getB_number()));
		model.addAttribute("commentList", commentList);
		model.addAttribute("b_create_date", formattedDate);

		return "/board/boarddetail";
	}

	// 선택 목록 삭제
	@DeleteMapping("/board")
	public String deleteBoard(@RequestParam("b_number") int b_number) throws UnsupportedEncodingException, Exception {
		BoardVO board = boardService.getBoard(b_number);

		// 삭제할 게시물이 존재하지 않으면 예외 처리
		if (board == null) {
			throw new IllegalArgumentException("해당 게시글이 존재하지 않습니다.");
		}

		// 게시물 삭제
		boardService.deleteBoardTx(b_number);

		// 삭제 후 목록으로 리디렉션
		return "redirect:/board?b_type=" + URLEncoder.encode(board.getB_type(), StandardCharsets.UTF_8.toString());
	}

	// 수정 누를 시 수정페이지로 이동
	@GetMapping("/board/page")
	public String updatePage(BoardVO vo, Model model) {
		BoardVO board = boardService.getBoard(vo.getB_number());
		model.addAttribute("board", board);
		return "/board/updateboard";
	}

	// 선택 목록 수정
	@PostMapping("/board/chan")
	public String updateBoard(@ModelAttribute  BoardVO vo) throws Exception {
		int cnt = boardService.updateBoardTx(vo);
		
		// 파일 처리 로직
				MultipartFile file = vo.getUploadFile();
				if (file != null && !file.isEmpty()) {
					// 파일 저장 경로 설정 (상대 경로)
					String uploadPath = "/resources/upfile/"; // 상대 경로 설정
					String fileName = file.getOriginalFilename();

					// 저장할 파일의 전체 경로
					String fullPath = new File(uploadPath).getAbsolutePath() + File.separator + fileName;

					// 파일을 해당 경로에 저장
					File dest = new File(fullPath);
					file.transferTo(dest);

					// BoardVO에 파일 경로 설정 (상대 경로 사용)
					vo.setB_file1(fileName); // 파일 경로를 BoardVO의 b_file1에 설정

					System.out.println("파일 저장 성공: " + fileName);
				} else {
					System.out.println("파일이 업로드되지 않았습니다.");
				}
		
		return "redirect:/boarddetail?b_number=" + vo.getB_number();
	}

//   ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ학사 일정ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	// 학사 일정 페이지 이동
	@GetMapping("/calpage")
	public String calPage() {
		return "/board/cal";
	}

	// 학사 일정 페이지 이동
	@GetMapping("/cal/admin")
	public String calAdmin() {
		return "/board/calAdmin";
	}

	// 학사 일정 목록
	@GetMapping("/cal/list")
	@ResponseBody
	public List<CalendarVO> getCalList() {
		List<CalendarVO> calList = boardService.getCalList();
		return calList;
	}

	// 학사 일정 상세 목록 가져오기
	@GetMapping("/cal/info")
	public String getCal(CalendarVO vo, Model model) {
		CalendarVO cal = boardService.getCal(vo);
		model.addAttribute("cal", cal);
		return "/board/cal";
	}

	// 학사 일정 등록
	@PostMapping(value = "/cal/list")
	@ResponseBody
	public String insertCal(@RequestBody List<CalendarVO> voList) throws IllegalStateException, IOException, Exception {
		// 배열로 받은 각 CalendarVO 객체를 처리
		
		for (CalendarVO vo : voList) {
			boardService.insertCalTx(vo);
		}
		return "redirect:/cal/info";
	}

	// 학사 일정 삭제
	@DeleteMapping("/cal")
	@ResponseBody
	public String deleteCal(int cal_number) throws UnsupportedEncodingException, Exception {
		// 일정 삭제
		boardService.deleteCalTx(cal_number);
		// 삭제 후 목록으로 리디렉션
		return "redirect:/cal/list";
	}

	// ㅡㅡㅡㅡㅡㅡㅡ댓글 입력ㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	@PostMapping(value = "/comment")
	public String insertComment(CommentVO vo) throws IllegalStateException, IOException, Exception {
		// 배열로 받은 각 CalendarVO 객체를 처리

		boardService.insertCommentTx(vo);
		return "redirect:/boarddetail?b_number=" + vo.getB_number();
	}

	// 댓글 삭제
	@DeleteMapping("/comment")
	public String deleteComment(@RequestParam("b_number") int b_number, int co_number) {
		boardService.deleteCommentTx(co_number);
		return "redirect:/boarddetail?b_number=" + b_number;
	}

}
