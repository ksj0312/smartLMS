package com.smart.view.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.smart.lms.service.BoardService;
import com.smart.lms.util.Pagination;
import com.smart.lms.vo.NoteVO;

@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;

	@PostMapping("/sendnote")
	@ResponseBody
	public void sendNote(@RequestParam("n_sender") String n_sender, @RequestParam("n_reciver") String n_reciver, @RequestParam("n_title") String n_title, @RequestParam("n_info") String n_info) throws Exception{
	    boardService.sendNoteTx(n_sender, n_reciver, n_title, n_info);
	    
	}

	@GetMapping("/receivnote")
	@ResponseBody
	public Map<String, Object> receivNote(@RequestParam("page") int page, @RequestParam("size") int size, @RequestParam("userId") String userId) {
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
	public Map<String, Object> searchNote(@RequestParam("page") int page, @RequestParam("size") int size, @RequestParam("search") String search, @RequestParam("userId") String userId){
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
	

	
	//쪽지 보기
	@GetMapping("/detailnote")
	@ResponseBody
	public NoteVO detailNote(@RequestParam String n_number) throws Exception {
		//System.out.println(n_number);
		boardService.updateNoteTx(n_number);
		NoteVO result = boardService.detailNote(n_number);
		return result;
	}
	
	//쪽지 삭제하기
	@DeleteMapping("/deletenote")
	@ResponseBody
	public void deleteNote(@RequestParam String n_number) throws Exception{
		System.out.println(n_number);
		boardService.deleteNoteTx(n_number);
		
	}
	
	
	
	
	@GetMapping("/go")
	public String go() {
	return "board/note";
	}
}
