package com.flour.web.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface BoardNewsMapper {
	
	public List<com.flour.web.domain.BoardNews> selectBoardNewsList(@Param("startRow") int startRow, @Param("pageSize")int pageSize) throws Exception;
	
	//페이지 행의 총개수
	public com.flour.web.domain.BoardNews BoardNewsPageCount() throws Exception;
	
	//제목검색페이지 행의 총개수
	public com.flour.web.domain.BoardNews BoardNewsSearchTitlePageCount(@Param("searchKeyword")  String searchKeyword) throws Exception;
	
	//작성자검색페이지
	public com.flour.web.domain.BoardNews BoardNewsSearchNamePageCount(@Param("searchKeyword")  String searchKeyword) throws Exception;
	
	//boardlist 제목 검색기능
	public List<com.flour.web.domain.BoardNews> searchBoardNewsTitle(@Param("searchKeyword")  String searchKeyword,@Param("startRow")  int startRow
			,@Param("pageSize")  int pageSize) throws Exception;
	
	//boardlist 작성자 검색기능
	public List<com.flour.web.domain.BoardNews> searchUserName(@Param("searchKeyword") String searchKeyword,
			@Param("startRow")  int startRow, @Param("pageSize") int pageSize) throws Exception;
	
	//move_boardinsert 기존 회원정보 보내는기능
	public com.flour.web.domain.BoardNews MoveBoardNewsInsert(@Param("userIdennum") String userIdennum) throws Exception;
	
	//boardinsert 등록
	public void BoardNewsInsert(com.flour.web.domain.BoardNews dto) throws Exception;

	//getboard로 이동 
	public com.flour.web.domain.BoardNews MoveGetBoardNews(@Param("BOARDNEWSID") String BOARDNEWSID) throws Exception;
	//getboard댓글
	public List<com.flour.web.domain.BoardNews> GetBoardNewsAllComment(@Param("BOARDNEWSID") String BOARDNEWSID) throws Exception;
	
	//조회수 증가
	public void BoardNewsCountIncrease(@Param("BOARDNEWSID") String BOARDNEWSID ) throws Exception;
	//게시글 삭제
	public void BoardNewsDelete(@Param("BOARDNEWSID") String BOARDNEWSID) throws Exception;
	//게시글삭제시 해당게시글댓글삭제 
	public void BoardNewsAllCommentDelete(@Param("BOARDNEWSID") String BOARDNEWSID) throws Exception;
	//게시글에서 파일삭제 버튼클릭시
	public void FileDelete(@Param("BOARDNEWSID")  String BOARDNEWSID ) throws Exception;
	//게시글 수정
	public void BoardNewsUpdate(com.flour.web.domain.BoardNews dto) throws Exception;
	//게시글 댓글 추가
	public	void BoardNewsCommentInsert(@Param("BOARDNEWSID") String BOARDNEWSID
			,@Param("BOARDNEWSCOMMENTCONTENT") String BOARDNEWSCOMMENTCONTENT
			,@Param("BOARDNEWSCOMMENTUSERID") String BOARDNEWSCOMMENTUSERID) throws Exception;
	
	//게시글 댓글 수정
	public	void BoardNewsCommentUpdate(@Param("BOARDNEWSCOMMENTID") String BOARDNEWSCOMMENTID
			,@Param("BOARDNEWSCOMMENTCONTENT") String BOARDNEWSCOMMENTCONTENT) throws Exception;
	//게시글 댓글 삭제	
	public	void BoardNewsCommentDelete(@Param("BOARDNEWSCOMMENTID") String BOARDNEWSCOMMENTID) throws Exception;
	
	//공지 인덱스 정보
	public List<com.flour.web.domain.BoardNews> indexBoardNews() throws Exception;
	
}
