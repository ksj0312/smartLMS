package com.smart.lms.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.smart.lms.util.Pagination;
import com.smart.lms.vo.BoardVO;
import com.smart.lms.vo.CalendarVO;

@Repository
public class BoardDAO {
	
	  @Autowired private SqlSessionTemplate mybatis;
	  
	  public List<BoardVO> getBoardList(Pagination pg) {
			return mybatis.selectList("boardDAO.getBoardList", pg);
		}

	  public void insertBoard(BoardVO vo) {
		     mybatis.insert("boardDAO.insertBoard", vo);
		}
		
		
	  public BoardVO getBoard(int b_number) {
		     return mybatis.selectOne("boardDAO.getBoard", b_number);
		}
		
	  public void deleteBoard(int b_number) {
		    mybatis.delete("boardDAO.deleteBoard", b_number);
	    }
	   
	  
	  public void updateBoard(BoardVO vo) {
		  	mybatis.update("boardDAO.updateBoard", vo);
	   }
	  
	  public CalendarVO getCal(CalendarVO vo) {
		     return mybatis.selectOne("boardDAO.getCal", vo);
		}
	  
	  public void insertCal(CalendarVO vo) {
		     mybatis.insert("boardDAO.insertCal", vo);
		}

	public List<CalendarVO> getCalList() {
		return mybatis.selectList("boardDAO.getCalList");

	}
	
	public int getBoardListTotalCnt(Pagination pg) {
		return mybatis.selectOne("boardDAO.getBoardListTotalCnt", pg);
		
	}
	
}
