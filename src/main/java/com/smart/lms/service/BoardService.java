package com.smart.lms.service;

import java.util.List;

import com.smart.lms.vo.BoardVO;

public interface BoardService {
	
	List<BoardVO> getBoardList(BoardVO vo);

	void insertBoard(BoardVO vo);

	BoardVO getBoard(BoardVO vo);

	void deleteBoard(BoardVO vo);

	void updateBoard(BoardVO vo);

}
