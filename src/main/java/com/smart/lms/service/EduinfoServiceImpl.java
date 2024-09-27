package com.smart.lms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smart.lms.dao.EduinfoDAO;

@Service("eduinfoService")
public class EduinfoServiceImpl implements EduinfoService {

	@Autowired
	private EduinfoDAO eduDAO;
}
