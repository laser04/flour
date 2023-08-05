package com.flour.web.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.flour.web.domain.BoardNews;

public interface BoardNewsService {
	
	//boardlist
    public List<BoardNews> selectBoardNewsList(int startRow, int pageSize) throws Exception;
	//페이징처리정보들
	public HashMap<String,Integer> pageInfo(Model model,String pageNum) throws Exception;
	
	//제목검색페이지 행의 총개수
	public List<BoardNews> BoardTitleSearchPageCount(String searchKeyword
			,int tstartRow, int tpageSize) throws Exception;
	//작성자검색페이지 행의 총개수
	public List<BoardNews> BoardWriterSearchPageCount(String searchKeyword
			,int wstartRow, int wpageSize) throws Exception;
	
	////제목검색시 페이징 정보처리
	public HashMap<String,Integer> pageTitleInfo(Model model,String pageNum,BoardNews dto) throws Exception;
	//작성자검색시 페이징 정보처리
	public HashMap<String,Integer> pageWriterInfo(Model model,String pageNum,BoardNews dto) throws Exception;
	
	
	//boardlist에 새글등록**(파일 입력)
	public void BoardNewsInsert(String USERID,BoardNews dto
			,MultipartFile uploadfile) throws Exception;
	
	//getboard로 이동
	public BoardNews MoveGetBoardNews(String BOARDNEWSID,HttpServletRequest request
			,HttpServletResponse response) throws Exception;
	//getboard에서 댓글 정보
	public List<BoardNews> CommentList(String BOARDNEWSID) throws Exception;
	
	//자유게시판 파일다운로드
	public ResponseEntity<Object> fileDownload(String BOARDNEWSID) throws Exception;
	
	//게시글 삭제 
	public void BoardNewsDelete(String BOARDNEWSID) throws Exception;
	//게시글에서 파일삭제 버튼클릭시
	public void FileDelete(String BOARDNEWSID) throws Exception;
	//게시글 수정
	public void BoardNewsUpdate(MultipartFile uploadfile,BoardNews dto) throws Exception;
	//게시글 댓글추가
	public void BoardNewsCommentInsert(String USERID,String BOARDNEWSID,String BOARDNEWSCOMMENTCONTENT) throws Exception;
	//게시글 댓글 수정
	public void BoardNewsCommentUpdate(String BOARDNEWSCOMMENTID
			,String BOARDNEWSCOMMENTCONTENT) throws Exception;
	//게시글 댓글 삭제	
	public void BoardNewsCommentDelete(String BOARDNEWSCOMMENTID) throws Exception;
	//공지 인덱스 정보
	public List<BoardNews> indexBoardNews() throws Exception;
	
	
	
}
