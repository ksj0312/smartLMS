package com.smart.view.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.smart.lms.service.BoardService;
import com.smart.lms.util.Pagination;
import com.smart.lms.vo.BoardVO;
import com.smart.lms.vo.CalendarVO;
@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	
	//게시판 목록
	@GetMapping("/getBoardList")
	public String getBoardList(@ModelAttribute Pagination pg, Model model, HttpSession session, @RequestParam(value = "b_type", defaultValue = "") String b_type) {
		
		int currPageNo = pg.getCurrPageNo();
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
	
	//게시글 등록 페이지 이동
	@GetMapping("/insertPage")
	public String insertPage(@RequestParam(value = "b_type", defaultValue = "") String b_type, Model model) {
	    model.addAttribute("b_type", b_type); // 기본값을 빈 문자열로 설정
	    return "/board/insertboard";
	}
	
	//게시글 등록 후 목록 페이지 이동
	@PostMapping(value = "/insertBoard")
	public String insertBoard(@ModelAttribute BoardVO vo) throws IllegalStateException, IOException, Exception {

		System.out.println("VO " + vo);
		
		 // 파일 처리 로직
	    MultipartFile file = vo.getUploadFile();
	    if (file != null && !file.isEmpty()) {
	        // 파일 저장 경로 설정
	        String uploadPath = "c:/smart/smartlms/src/main/webapp/resources/upfile/"; // 저장할 경로 설정
	        String fileName = file.getOriginalFilename();
	        
	        // 파일을 해당 경로에 저장
	        File dest = new File(uploadPath + fileName);
	        file.transferTo(dest);
	        
	        // BoardVO에 파일 경로 설정
	        vo.setB_file1(uploadPath + fileName); // 파일 경로를 BoardVO의 b_file1에 설정

	        System.out.println("파일 저장 성공: " + fileName);
	    } else {
	        System.out.println("파일이 업로드되지 않았습니다.");
	    }
	    
		boardService.insertBoardTx(vo);
		
		String btype = "게시판";
		
		if(vo.getB_type().equals(btype)) {
 
			return "redirect:/getBoardList?b_type=" + URLEncoder.encode(btype, StandardCharsets.UTF_8.toString());
		}else {
			
			return "redirect:/getBoardList?b_type=QNA";
		}
		
	}
	
	
	//파일 다운로드 로직
	@GetMapping("/downloadFile")
	public void downloadFile(@RequestParam("filePath") String filePath, HttpServletResponse response) throws IOException {
	    // URL 디코딩 (공백 및 특수문자를 처리하기 위해)
	    String decodedFilePath = java.net.URLDecoder.decode(filePath, "UTF-8");
	    
	    // 파일 객체 생성
	    File file = new File(decodedFilePath);

	    if (file.exists()) {
	        response.setContentType("application/octet-stream");
	        response.setHeader("Content-Disposition", "attachment; filename=\"" + URLEncoder.encode(file.getName(), "UTF-8").replaceAll("\\+", "%20") + "\"");
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
	
	//목록 누를시 상세 내용으로 이동
	@GetMapping("/getBoard")
	public String getBoard(BoardVO vo, Model model) {
		BoardVO board = boardService.getBoard(vo.getB_number());
		model.addAttribute("board", board);
		return "/board/boarddetail";
	}
	
	
	//선택 목록 삭제
	@DeleteMapping("/deleteBoard")
	public String deleteBoard(@RequestParam ("b_number") int b_number) throws UnsupportedEncodingException,  Exception {
		BoardVO board = boardService.getBoard(b_number);
	    
	    // 삭제할 게시물이 존재하지 않으면 예외 처리
	    if (board == null) {
	        throw new IllegalArgumentException("해당 게시글이 존재하지 않습니다.");
	    }

	    // 게시물 삭제
	    boardService.deleteBoardTx(b_number);
	    
	    // 로그 출력
	    System.out.println("게시글 번호: " + b_number);
	    System.out.println("게시글 내용: " + board);
	    System.out.println("게시글이 삭제되었습니다.");
	    
	    // 삭제 후 목록으로 리디렉션
	    return "redirect:/getBoardList?b_type=" + URLEncoder.encode(board.getB_type(), StandardCharsets.UTF_8.toString());
	}
	
	//수정 누를 시 수정페이지로 이동
	@GetMapping("/updatePage")
	public String updatePage(BoardVO vo, Model model) {
		BoardVO board = boardService.getBoard(vo.getB_number());
		model.addAttribute("board", board);
		return "/board/updateboard";
	}
	

	//선택 목록 수정
	@PostMapping("/updateBoard")
	public String updateBoard(@ModelAttribute BoardVO vo)  throws Exception {
		boardService.updateBoardTx(vo);
		return "redirect:/getBoard?b_number=" + vo.getB_number();
	}
	
	
	
	//학사 일정 페이지 이동
	@GetMapping("/calPage")
	public String calPage() {
		return "/board/cal";
	}
	
	
	//학사 일정 목록
	 @GetMapping("/getCalList")
	 @ResponseBody
	    public List<CalendarVO> getCalList() {
	        List<CalendarVO> calList = boardService.getCalList();
	        return calList; 
	 }
	
	
	
	//학사 일정 상세 목록 가져오기
	@GetMapping("/getCal")
	public String getCal(CalendarVO vo, Model model) {
		CalendarVO cal = boardService.getCal(vo);
		model.addAttribute("cal", cal);
		return "/board/cal";
	}
	
	
	//학사 일정 등록
	@PostMapping(value = "/insertCal")
	public String insertCal(@RequestBody List<CalendarVO> voList) throws IllegalStateException, IOException , Exception{
	    // 배열로 받은 각 CalendarVO 객체를 처리
	    for (CalendarVO vo : voList) {
	        boardService.insertCalTx(vo);
	    }
	    return "redirect:/getCal";
	}
	
	
	
	
	
	

	
	
	
	
}
