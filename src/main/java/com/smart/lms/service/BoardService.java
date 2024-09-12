package com.smart.lms.service;

import java.util.List;

import com.smart.lms.vo.NoteVO;

public interface BoardService {
	
	void sendNote(NoteVO vo);

	List<NoteVO> receivNote();
}
