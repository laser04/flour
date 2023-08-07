package com.flour.web.mapper;

import java.util.List;

import com.flour.web.domain.Board;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface BoardMapper {

	List<Board> selectBoardList(@Param("startRow")	int startRow,@Param("pageSize") int pageSize) ;
	
	//페이지 행의 총개수
	int BoardPageCount() ;
	
	//제목검색페이지 행의 총개수
	Board BoardSearchTitlePageCount(@Param("searchKeyword")String searchKeyword) ;
	
	//작성자검색페이지
	Board BoardSearchNamePageCount(@Param("searchKeyword") String searchKeyword) ;
	
	//boardlist 제목 검색기능
	List<Board> searchBoardTitle
	(@Param("searchKeyword")	String searchKeyword,
	 @Param("startRow")		int startRow,
	 @Param("pageSize")		int pageSize) ;
	
	//boardlist 작성자 검색기능
	List<Board> searchUserName(
	@Param("searchKeyword")	String searchKeyword,
	@Param("startRow")	 int startRow,
	@Param("pageSize")	int pageSize) ;
	
	//move_boardinsert 기존 회원정보 보내는기능
	Board moveBoardInsert(@Param("userIdennum")	String userIdennum);
	//boardinsert 등록
	void BoardInsert(Board dto) ;
	
	
	//getboard로 이동 
	Board MoveGetBoard(@Param("boardId")String boardId) ;
	//getboard댓글
	List<Board> GetBoardAllComment(@Param("boardId") String boardId) ;
	
	//조회수 증가
	void BoardCountIncrease(@Param("boardId") String boardId ) ;
	//게시글 삭제
	void BoardDelete(@Param("boardId") String boardId) ;
	//게시글삭제시 해당게시글댓글삭제 
	void BoardAllCommentDelete( @Param("boardId") String boardId) ;
	//게시글에서 파일삭제 버튼클릭시
	void FileDelete(@Param("boardId") String boardId ) ;
	//게시글 수정
	void BoardUpdate(Board dto) ;
	//게시글 댓글 추가
	void BoardCommentInsert(@Param("boardId") String boardId
			,@Param("content") String content
			,@Param("boardCommentUserIdennum") String boardCommentUserIdennum) ;
	
	//게시글 댓글 수정
	void BoardCommentUpdate(@Param("boardCommentId") String boardCommentId
			,@Param("content")String content) ;
	//게시글 댓글 삭제	
	void BoardCommentDelete(@Param("boardCommentId") String boardCommentId) ;
	
	
}
