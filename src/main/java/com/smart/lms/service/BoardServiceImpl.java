package com.smart.lms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smart.lms.dao.BoardDAO;
import com.smart.lms.util.Pagination;
import com.smart.lms.vo.NoteVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boDAO;
	
//	@Override
//	public void sendNoteTx(NoteVO vo) {
//		System.out.println(vo);
//		boDAO.sendNote(vo);
//	}
	
	@Override
	public void sendNoteTx(String n_sender, String n_reciver, String n_title, String n_info) throws Exception{
		boDAO.sendNote(n_sender, n_reciver, n_title, n_info);
		
	}

	@Override
	public List<NoteVO> receivNote() {
		return boDAO.receivNote();
	}

	@Override
	public NoteVO detailNote(String n_number) {
		return boDAO.detailNote(n_number); 
		
	}

	@Override
	public void updateNoteTx(String n_number) throws Exception{
		boDAO.updateNote(n_number);
		
	}

	@Override
	public void deleteNoteTx(String n_number) throws Exception{
		boDAO.deleteNote(n_number);
		
	}

	@Override
	public List<NoteVO> searchNote(String search) {
		return boDAO.searchNote(search);
	}


	@Override
	public List<NoteVO> getNotesWithPagination(int start, int size, String userId) {
		return boDAO.getNotesWithPagination(start, size, userId);
	}

	@Override
	public int getTotalSearchNoteCount(String search, String userId) {
		return boDAO.getTotalSearchNoteCount(search, userId);
	}

	
	@Override
	public int getTotalNoteCount(String userId) {
		return boDAO.getTotalNoteCount(userId);
	}

	@Override
	public List<NoteVO> getSearchNotesWithPagination(int start, int size, String search, String userId) {
		return boDAO.getSearchNotesWithPagination(start, size, search, userId);
	}

	
//	@Override
//	public List<NoteVO> getSearchNotesWithPagination(Pagination pg) {
//		return boDAO.getSearchNotesWithPagination(pg);
//	}

}
