package com.flour.FlourProject.board.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.flour.FlourProject.board.dto.BoardDTO;
import com.flour.FlourProject.board.mapper.BoardMapper;

//일단 대기!! 필요없을듯
@Repository
public class BoardRepository {

	private final SqlSession sqlSession;
    
    @Autowired
    public BoardRepository(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }
    
    
    public List<BoardDTO> selectBoardList(int startRow,int pageSize) throws Exception {
    	BoardMapper boardmapper = sqlSession.getMapper(BoardMapper.class);
        return boardmapper.selectBoardList(startRow,pageSize);
          }
	
	
}
