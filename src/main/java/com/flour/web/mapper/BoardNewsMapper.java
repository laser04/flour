package com.flour.web.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardNewsMapper {
	
	public List<com.flour.web.domain.BoardNews> selectBoardNewsList(int startRow, int pageSize) throws Exception;
	
	//페이지 행의 총개수
	public com.flour.web.domain.BoardNews BoardNewsPageCount() throws Exception;
	
	//제목검색페이지 행의 총개수
	public com.flour.web.domain.BoardNews BoardNewsSearchTitlePageCount(String searchKeyword) throws Exception;
	
	//작성자검색페이지
	public com.flour.web.domain.BoardNews BoardNewsSearchNamePageCount(String searchKeyword) throws Exception;
	
	//boardlist 제목 검색기능
	public List<com.flour.web.domain.BoardNews> searchBoardNewsTitle(String searchKeyword, int startRow, int pageSize) throws Exception;
	
	//boardlist 작성자 검색기능
	public List<com.flour.web.domain.BoardNews> searchUserName(String searchKeyword, int startRow, int pageSize) throws Exception;
	
	//move_boardinsert 기존 회원정보 보내는기능
	public com.flour.web.domain.BoardNews MoveBoardNewsInsert(String userIdennum) throws Exception;
	
	//boardinsert 등록
	public void BoardNewsInsert(com.flour.web.domain.BoardNews dto) throws Exception;
	
	/*
  	BOARD_ID 컬럼이 INT 형으로 정의되어 있다면 MyBatis가 
  	자동으로 타입 변환을 수행하여 데이터베이스에 저장됩니다. 
  	이러한 자동 타입 변환은 MyBatis의 내장 타입 핸들러에 의해 처리됩니다.
  	**즉,MyBatis는 Java 객체와 SQL 문 사이에 매개 변수 및 결과를 자동으로 매핑해주는 기능을 제공
	 */
	//getboard로 이동 
	public com.flour.web.domain.BoardNews MoveGetBoardNews(String BOARDNEWSID) throws Exception;
	//getboard댓글
	public List<com.flour.web.domain.BoardNews> GetBoardNewsAllComment(String BOARDNEWSID) throws Exception;
	
	//조회수 증가
	public void BoardNewsCountIncrease(String BOARDNEWSID ) throws Exception;
	//게시글 삭제
	public void BoardNewsDelete(String BOARDNEWSID) throws Exception;
	//게시글삭제시 해당게시글댓글삭제 
	public void BoardNewsAllCommentDelete(String BOARDNEWSID) throws Exception;
	//게시글에서 파일삭제 버튼클릭시
	public void FileDelete( String BOARDNEWSID ) throws Exception;
	//게시글 수정
	public void BoardNewsUpdate(com.flour.web.domain.BoardNews dto) throws Exception;
	//게시글 댓글 추가
	public	void BoardNewsCommentInsert(String BOARDNEWSID
			,String BOARDNEWSCOMMENTCONTENT
			,String BOARDNEWSCOMMENTUSERID) throws Exception;
	
	//게시글 댓글 수정
	public	void BoardNewsCommentUpdate(String BOARDNEWSCOMMENTID
			,String BOARDNEWSCOMMENTCONTENT) throws Exception;
	//게시글 댓글 삭제	
	public	void BoardNewsCommentDelete(String BOARDNEWSCOMMENTID) throws Exception;
	
	//공지 인덱스 정보
	public List<com.flour.web.domain.BoardNews> indexBoardNews() throws Exception;
	
}
