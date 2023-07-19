package com.flour.FlourProject.board.service;

import java.util.List;

import com.flour.FlourProject.board.dto.BoardDTO;

public interface BoardService {
	
	//boardlist
	List<BoardDTO> selectBoardList(int startRow,int pageSize) throws Exception;
	
	BoardDTO BoardPageCount() throws Exception; 
	BoardDTO BoardSearchTitlePageCount(String searchKeyword) throws Exception;
	BoardDTO BoardSearchNamePageCount(String searchKeyword) throws Exception;
	
	//boardlist 제목 검색기능
	List<BoardDTO>	searchBoardTitle(String searchKeyword
			,int startRow,int pageSize) throws Exception; 
	//boardlist 작성자 검색기능
	List<BoardDTO> searchUserName(String searchKeyword
			,int startRow,int pageSize) throws Exception;
	
}
