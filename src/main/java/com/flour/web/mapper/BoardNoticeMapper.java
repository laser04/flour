package com.flour.web.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface BoardNoticeMapper {

	public List<com.flour.web.domain.BoardNotice> selectBoardNoticeList(@Param("startRow") int startRow, @Param("pageSize") int pageSize) throws Exception;
	
	//페이지 행의 총개수
	public com.flour.web.domain.BoardNotice BoardNoticePageCount() throws Exception;
	
	//제목검색페이지 행의 총개수
	public com.flour.web.domain.BoardNotice BoardNoticeSearchTitlePageCount(@Param("searchKeyword") String searchKeyword) throws Exception;
	
	//작성자검색페이지
	public com.flour.web.domain.BoardNotice BoardNoticeSearchNamePageCount(@Param("searchKeyword") String searchKeyword) throws Exception;
	
	//boardlist 제목 검색기능
	public List<com.flour.web.domain.BoardNotice> searchBoardNoticeTitle
	(@Param("searchKeyword") String searchKeyword,@Param("startRow") int startRow,@Param("pageSize") int pageSize) throws Exception;
	
	//boardlist 작성자 검색기능
	public List<com.flour.web.domain.BoardNotice> searchUserName
	(@Param("searchKeyword") String searchKeyword,@Param("startRow") int startRow,@Param("pageSize") int pageSize) throws Exception;
	
	//move_boardinsert 기존 회원정보 보내는기능
	public com.flour.web.domain.BoardNotice MoveBoardNoticeInsert(@Param("userIdennum") String userIdennum) throws Exception;
	
	//boardinsert 등록
	public void BoardNoticeInsert(com.flour.web.domain.BoardNotice dto) throws Exception;
	

	//getboard로 이동 
	public com.flour.web.domain.BoardNotice MoveGetBoardNotice(@Param("BOARDNOTICEID") String BOARDNOTICEID) throws Exception;
	//getboard댓글
	public List<com.flour.web.domain.BoardNotice> GetBoardNoticeAllComment(@Param("BOARDNOTICEID") String BOARDNOTICEID) throws Exception;
	
	//조회수 증가
	public void BoardNoticeCountIncrease(@Param("BOARDNOTICEID") String BOARDNOTICEID ) throws Exception;
	//게시글 삭제
	public void BoardNoticeDelete(@Param("BOARDNOTICEID") String BOARDNOTICEID) throws Exception;
	//게시글삭제시 해당게시글댓글삭제 
	public void BoardNoticeAllCommentDelete(@Param("BOARDNOTICEID") String BOARDNOTICEID) throws Exception;
	//게시글에서 파일삭제 버튼클릭시
	public void FileDelete(@Param("BOARDNOTICEID") String BOARDNOTICEID ) throws Exception;
	//게시글 수정
	public void BoardNoticeUpdate(com.flour.web.domain.BoardNotice dto) throws Exception;
	//게시글 댓글 추가
	public	void BoardNoticeCommentInsert(@Param("BOARDNOTICEID") String BOARDNOTICEID,
			@Param("BOARDNOTICECOMMENTCONTENT") String BOARDNOTICECOMMENTCONTENT,
			@Param("BOARDNOTICECOMMENTUSERID")String BOARDNOTICECOMMENTUSERID) throws Exception;
	
	//게시글 댓글 수정
	public	void BoardNoticeCommentUpdate(@Param("BOARDNOTICECOMMENTID") String BOARDNOTICECOMMENTID,
			@Param("BOARDNOTICECOMMENTCONTENT")String BOARDNOTICECOMMENTCONTENT) throws Exception;
	//게시글 댓글 삭제	
	public	void BoardNoticeCommentDelete(@Param("BOARDNOTICECOMMENTID")String BOARDNOTICECOMMENTID) throws Exception;

	//공지 인덱스 정보
	public List<com.flour.web.domain.BoardNotice> indexBoardNotice() throws Exception;
	
	
}
