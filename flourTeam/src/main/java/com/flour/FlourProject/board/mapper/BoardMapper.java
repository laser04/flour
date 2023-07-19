package com.flour.FlourProject.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import com.flour.FlourProject.board.dto.BoardDTO;

@Mapper
public interface BoardMapper {

	List<BoardDTO> selectBoardList(@Param("startRow") int startRow,
			@Param("pageSize")int pageSize) throws Exception;
	
	//페이지 행의 총개수
	BoardDTO BoardPageCount() throws Exception;
	//제목검색페이지 행의 총개수
	BoardDTO BoardSearchTitlePageCount(
			@Param("searchKeyword")String searchKeyword) throws Exception;
	//작성자검색페이지
	BoardDTO BoardSearchNamePageCount(
			@Param("searchKeyword")String searchKeyword) throws Exception;
	//boardlist 제목 검색기능
	List<BoardDTO> searchBoardTitle
	(@Param("searchKeyword")String searchKeyword,
			@Param("startRow") int startRow,
			@Param("pageSize")int pageSize) throws Exception;
	//boardlist 작성자 검색기능
	List<BoardDTO> searchUserName
	(@Param("searchKeyword") String searchKeyword,
			@Param("startRow") int startRow,
			@Param("pageSize")int pageSize) throws Exception;
	
	
}
