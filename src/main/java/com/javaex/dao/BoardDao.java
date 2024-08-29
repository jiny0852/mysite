package com.javaex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.BoardVo;

@Repository
public class BoardDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<BoardVo> getList () {
		
		System.out.println("boardDao.getList()");
		
		List<BoardVo> boardList = sqlSession.selectList("board.selectList");
		
		
		return boardList;
		
	}
	
	public BoardVo getRead (int no) {
		
		System.out.println("boardDao.getRead()");
		
		BoardVo boardVo = sqlSession.selectOne("board.selectRead", no);
		
		return boardVo;
	}

	public BoardVo getInsert ( BoardVo boardVo ) {
		
		System.out.println("boardDao.getInsert()");
		
		int count = sqlSession.insert("board.insert", boardVo);		
		
		if (count == 1) {
			return boardVo;
		} else {
			return null;
		}
	}
	
	
	
	
	
	
	
	
	
	
	
}
