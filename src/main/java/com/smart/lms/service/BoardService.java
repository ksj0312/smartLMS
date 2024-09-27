package com.smart.lms.service;

import java.util.List;

import com.smart.lms.util.Pagination;
import com.smart.lms.vo.BoardVO;
import com.smart.lms.vo.CalendarVO;
import com.smart.lms.vo.NoteVO;

public interface BoardService {
	
	void sendNoteTx(String n_sender, String n_reciver, String n_title, String n_info)throws Exception;

	List<NoteVO> receivNote();

	NoteVO detailNote(String n_number);

	void updateNoteTx(String n_number)throws Exception;

	void deleteNoteTx(String n_number)throws Exception;

	List<NoteVO> searchNote(String search);

	List<NoteVO> getNotesWithPagination(int start, int size, String userId);

	int getTotalNoteCount(String userId);
	
	int getTotalSearchNoteCount(String search, String userId);

	List<NoteVO> getSearchNotesWithPagination(int start, int size, String search, String userId);
	
	
//	boardService-------
	
	List<BoardVO> getBoardList(Pagination pg);

	void insertBoardTx(BoardVO vo);

	BoardVO getBoard(int b_number);

	void deleteBoardTx(int b_number);

	void updateBoardTx(BoardVO vo);

	CalendarVO getCal(CalendarVO vo);

	void insertCalTx(CalendarVO vo);

	List<CalendarVO> getCalList(); //�빐�떦�븯�뒗 由ъ뒪�듃 �궡�뿭 諛섑솚
	
	public int getBoardListTotalCnt(Pagination pg);  //�빐�떦�븯�뒗 由ъ뒪�듃 珥앷갗�닔 諛섑솚

}
