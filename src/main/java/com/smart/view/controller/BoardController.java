package com.smart.view.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.smart.lms.service.BoardService;

@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;
}
