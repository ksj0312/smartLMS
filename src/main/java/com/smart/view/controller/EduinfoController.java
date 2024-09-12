package com.smart.view.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.smart.lms.service.EduinfoService;


@Controller
public class EduinfoController {
	@Autowired
	private EduinfoService eduinfoService;
}
