package com.smart.view.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.smart.lms.service.BoardService;
import com.smart.lms.vo.NoteVO;

@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	@PostMapping("/sendnote")
	public String sendNote(@ModelAttribute NoteVO vo) {
	    boardService.sendNote(vo);
	    return "redirect:/";
	}
	
	@GetMapping("/receivnote")
	@ResponseBody
	public List<NoteVO> receivNote(Model model) {
		List<NoteVO> receivNote = boardService.receivNote();
		System.out.println(receivNote);
		//model.addAttribute("note", receivNote);
		
		return receivNote;
	}
	
//	@GetMapping("/detailnote")
//	@ResponseBody
//	public List<NoteVO> detailNote
	@GetMapping("/go")
	public String go() {
	return "board/sendnote";
	}
}
