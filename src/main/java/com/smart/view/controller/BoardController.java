package com.smart.view.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.smart.lms.service.BoardService;
import com.smart.lms.vo.BoardVO;

@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	
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
		return "redirect:/getBoardList";
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
