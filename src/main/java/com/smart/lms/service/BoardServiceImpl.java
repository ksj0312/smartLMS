package com.smart.lms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smart.lms.dao.BoardDAO;
import com.smart.lms.vo.NoteVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boDAO;
	
	@Override
	public void sendNote(NoteVO vo) {
		System.out.println(vo);
		boDAO.sendNote(vo);
	}

	@Override
	public List<NoteVO> receivNote() {
		return boDAO.receivNote();
	}
}
