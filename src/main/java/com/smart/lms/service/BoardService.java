package com.smart.lms.service;

import java.util.List;

import com.smart.lms.util.Pagination;
import com.smart.lms.vo.BoardVO;
import com.smart.lms.vo.CalendarVO;

public interface BoardService {
	
	List<BoardVO> getBoardList(Pagination pg);

	void insertBoardTx(BoardVO vo);

	BoardVO getBoard(int b_number);

	void deleteBoardTx(int b_number);

	void updateBoardTx(BoardVO vo);

	CalendarVO getCal(CalendarVO vo);

	void insertCalTx(CalendarVO vo);

	List<CalendarVO> getCalList(); //해당하는 리스트 내역 반환
	
	public int getBoardListTotalCnt(Pagination pg);  //해당하는 리스트 총갯수 반환


}
