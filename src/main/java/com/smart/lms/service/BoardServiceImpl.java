package com.smart.lms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smart.lms.dao.BoardDAO;
import com.smart.lms.util.Pagination;
import com.smart.lms.vo.BoardVO;
import com.smart.lms.vo.CalendarVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boDAO;
	
	@Override
	public List<BoardVO> getBoardList(Pagination pg) {
		return boDAO.getBoardList(pg);
	}

	@Override
	public void insertBoardTx(BoardVO vo) {
		boDAO.insertBoard(vo);
	}

	@Override
	public BoardVO getBoard(int b_number) {
		return boDAO.getBoard(b_number);
	}
	
	@Override
	public void deleteBoardTx(int b_number) {
		boDAO.deleteBoard(b_number);
	}
	
	@Override
	public void updateBoardTx(BoardVO vo) {
		boDAO.updateBoard(vo);
	}
	
	@Override
	public CalendarVO getCal(CalendarVO vo) {
		return boDAO.getCal(vo);
	}
	
	@Override
	public void insertCalTx(CalendarVO vo) {
		System.out.println(vo);
		System.out.println(vo.toString());
		System.out.println();
		boDAO.insertCal(vo);
	}

	@Override
	public List<CalendarVO> getCalList() {
		return boDAO.getCalList();
	}
	
	@Override
	public int getBoardListTotalCnt(Pagination pg) {
		return boDAO.getBoardListTotalCnt(pg);
	}
	
}
