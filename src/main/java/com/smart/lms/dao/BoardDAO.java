package com.smart.lms.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.smart.lms.vo.BoardVO;

@Repository
public class BoardDAO {
	
	  @Autowired private SqlSessionTemplate mybatis;
	  
	  public List<BoardVO> getBoardList(BoardVO vo) {
			return mybatis.selectList("boardDAO.getBoardList", vo);
		}

	  public void insertBoard(BoardVO vo) {
		     mybatis.insert("boardDAO.insertBoard", vo);
		}
		
		
	  public BoardVO getBoard(BoardVO vo) {
		     return mybatis.selectOne("boardDAO.getBoard", vo);
		}
		
	  public void deleteBoard(BoardVO vo) {
		    mybatis.delete("boardDAO.deleteBoard", vo);
	    }
	   
	  
	  public void updateBoard(BoardVO vo) {
		  	mybatis.update("boardDAO.updateBoard", vo);
	   }

}
