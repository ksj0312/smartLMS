package com.smart.lms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smart.lms.dao.BoardDAO;
import com.smart.lms.vo.BoardVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boDAO;

	@Override
	public List<BoardVO> getBoardList(BoardVO vo) {
		return boDAO.getBoardList(vo);
	}

	@Override
	public void insertBoard(BoardVO vo) {
		boDAO.insertBoard(vo);
	}

	@Override
	public BoardVO getBoard(BoardVO vo) {
		return boDAO.getBoard(vo);
	}
	
	@Override
	public void deleteBoard(BoardVO vo) {
		boDAO.deleteBoard(vo);
	}
	
	@Override
	public void updateBoard(BoardVO vo) {
		boDAO.updateBoard(vo);
	}
}
