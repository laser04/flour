package com.flour.web.mapper;

import java.util.List;

import com.flour.web.domain.Board;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardMapper {

	List<Board> selectBoardList(int startRow, int pageSize) ;
	
	//페이지 행의 총개수
	int BoardPageCount() ;
	
	//제목검색페이지 행의 총개수
	Board BoardSearchTitlePageCount(String searchKeyword) ;
	
	//작성자검색페이지
	Board BoardSearchNamePageCount(String searchKeyword) ;
	
	//boardlist 제목 검색기능
	List<Board> searchBoardTitle
	(String searchKeyword,
			int startRow,
			int pageSize) ;
	
	//boardlist 작성자 검색기능
	List<Board> searchUserName(
	 String searchKeyword,
			 int startRow,
			int pageSize) ;
	
	//move_boardinsert 기존 회원정보 보내는기능
	Board moveBoardInsert(String userIdennum);
	//boardinsert 등록
	void BoardInsert(Board dto) ;
	
	/*
  	BOARD_ID 컬럼이 INT 형으로 정의되어 있다면 MyBatis가 
  	자동으로 타입 변환을 수행하여 데이터베이스에 저장됩니다. 
  	이러한 자동 타입 변환은 MyBatis의 내장 타입 핸들러에 의해 처리됩니다.
  	**즉,MyBatis는 Java 객체와 SQL 문 사이에 매개 변수 및 결과를 자동으로 매핑해주는 기능을 제공
	 */
	//getboard로 이동 
	Board MoveGetBoard(String boardId) ;
	//getboard댓글
	List<Board> GetBoardAllComment(String boardId) ;
	
	//조회수 증가
	void BoardCountIncrease( String boardId ) ;
	//게시글 삭제
	void BoardDelete(String boardId) ;
	//게시글삭제시 해당게시글댓글삭제 
	void BoardAllCommentDelete(String boardId) ;
	//게시글에서 파일삭제 버튼클릭시
	void FileDelete( String boardId ) ;
	//게시글 수정
	void BoardUpdate(Board dto) ;
	//게시글 댓글 추가
	void BoardCommentInsert(String boardId
			,String content
			,String boardCommentUserIdennum) ;
	
	//게시글 댓글 수정
	void BoardCommentUpdate(String boardCommentId
			,String content) ;
	//게시글 댓글 삭제	
	void BoardCommentDelete(String boardCommentId) ;
	
	
}
