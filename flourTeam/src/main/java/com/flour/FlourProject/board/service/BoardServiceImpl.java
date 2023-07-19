package com.flour.FlourProject.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.flour.FlourProject.board.dto.BoardDTO;
import com.flour.FlourProject.board.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
    private  BoardMapper boardMapper;

	
	
	@Override
	public List<BoardDTO> selectBoardList(int startRow,int pageSize) throws Exception {
		
		return boardMapper.selectBoardList(startRow,pageSize);
	}



	@Override
	public BoardDTO BoardPageCount() throws Exception {
		
		return boardMapper.BoardPageCount();
	}
	
	@Override
	public BoardDTO BoardSearchTitlePageCount(String searchKeyword) throws Exception {
		
		return boardMapper.BoardSearchTitlePageCount(searchKeyword);
	}
	

	@Override
	public BoardDTO BoardSearchNamePageCount(String searchKeyword) throws Exception {
		// TODO Auto-generated method stub
		return boardMapper.BoardSearchNamePageCount(searchKeyword);
	}

	@Override
	public List<BoardDTO> searchBoardTitle(String searchKeyword
			,int startRow,int pageSize) throws Exception {
		
		return boardMapper.searchBoardTitle(searchKeyword, startRow, pageSize);
	}
	
	@Override
	public List<BoardDTO> searchUserName(String searchKeyword
			,int startRow,int pageSize) throws Exception {
		
		return boardMapper.searchUserName(searchKeyword, startRow, pageSize);
	}





	
}
