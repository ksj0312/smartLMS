package com.smart.lms.service;

import java.util.List;

import com.smart.lms.util.Pagination;
import com.smart.lms.vo.BoardVO;
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
	
	List<BoardVO> getBoardList(BoardVO vo);

	void insertBoard(BoardVO vo);

	BoardVO getBoard(BoardVO vo);

	void deleteBoard(BoardVO vo);

	void updateBoard(BoardVO vo);

	boolean checkUser(String n_reciver);

	int noteCount(String userId);
}
