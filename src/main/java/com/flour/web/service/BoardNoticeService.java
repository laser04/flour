package com.flour.web.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.flour.web.domain.BoardNotice;

public interface BoardNoticeService {
	
	//boardlist
	public List<BoardNotice> selectBoardNoticeList(int startRow, int pageSize) throws Exception;
	//페이징처리정보들
	public HashMap<String,Integer> pageInfo(Model model,String pageNum) throws Exception;

	//제목검색페이지 행의 총개수
	public List<BoardNotice> BoardTitleSearchPageCount(String searchKeyword
			,int tstartRow, int tpageSize) throws Exception;
	//작성자검색페이지 행의 총개수
	public List<BoardNotice> BoardWriterSearchPageCount(String searchKeyword
			,int wstartRow, int wpageSize) throws Exception;
	
	////제목검색시 페이징 정보처리
	public HashMap<String,Integer> pageTitleInfo(Model model,String pageNum,BoardNotice dto) throws Exception;
	//작성자검색시 페이징 정보처리
	public HashMap<String,Integer> pageWriterInfo(Model model,String pageNum,BoardNotice dto) throws Exception;

	//boardlist에 새글등록**(파일 입력)
	public void BoardNoticeInsert(String USERID,BoardNotice dto
			,MultipartFile uploadfile) throws Exception;
	
	
	//getboard로 이동
	public BoardNotice MoveGetBoardNotice(String BOARDNOTICEID,HttpServletRequest request
			,HttpServletResponse response) throws Exception;
	
	//getboard에서 댓글 정보
	public List<BoardNotice> CommentList(String BOARDNOTICEID) throws Exception;
	
	//자유게시판 파일다운로드
	public ResponseEntity<Object> fileDownload(String BOARDNOTICEID) throws Exception;
	
	//게시글 삭제 
	public void BoardNoticeDelete(String BOARDNOTICEID) throws Exception;
	//게시글에서 파일삭제 버튼클릭시
	public void FileDelete(String BOARDNOTICEID) throws Exception;
	//게시글 수정
	public void BoardNoticeUpdate(MultipartFile uploadfile,BoardNotice dto) throws Exception;
	//게시글 댓글추가
	public void BoardNoticeCommentInsert(String USERID, String BOARDNOTICEID,String BOARDNOTICECOMMENTCONTENT) throws Exception;
	//게시글 댓글 수정
	public void BoardNoticeCommentUpdate(String BOARDNOTICECOMMENTID
			,String BOARDNOTICECOMMENTCONTENT) throws Exception;
	//게시글 댓글 삭제	
	public void BoardNoticeCommentDelete(String BOARDNOTICECOMMENTID) throws Exception;
	
	
	//공지 인덱스 정보
	public List<BoardNotice> indexBoardNotice() throws Exception;


}
