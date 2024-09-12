package com.smart.lms.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.smart.lms.vo.NoteVO;

@Repository
public class BoardDAO {
	
	  @Autowired 
	  private SqlSessionTemplate mybatis;
	  
	  public void sendNote(NoteVO vo) {
			System.out.println(vo);
			mybatis.insert("boardDAO.sendNote", vo);
			
		}


		public List<NoteVO> receivNote() {
			
			return mybatis.selectList("boardDAO.receivNote");
		}


}
