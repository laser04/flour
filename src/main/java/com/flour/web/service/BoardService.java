package com.flour.web.service;


import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.flour.web.domain.Board;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;


public interface BoardService {

    //boardlist
    List<Board> selectBoardList(int startRow, int pageSize) ;

    //페이징처리정보들
    HashMap<String, Integer> pageInfo(Model model, String pageNum) throws Exception;

    //제목검색페이지 행의 총개수
    List<Board> boardTitleSearchPageCount(String searchKeyword
            , int tstartRow, int tpageSize) ;

    //작성자검색페이지 행의 총개수
    List<Board> boardWriterSearchPageCount(String searchKeyword
            , int wstartRow, int wpageSize) ;

    ////제목검색시 페이징 정보처리
    HashMap<String, Integer> pageTitleInfo(Model model, String pageNum, Board board) throws Exception;

    //작성자검색시 페이징 정보처리
    HashMap<String, Integer> pageWriterInfo(Model model, String pageNum, Board board) throws Exception;

    //move_boardinsert 기존 회원정보 보내는기능
    Board moveBoardInsert(String userIdennum) ;


    //boardlist에 새글등록**(파일 입력)
    void boardInsert(Board board
            , MultipartFile uploadfile, String idennum) throws Exception;

    //getboard로 이동
    Board moveGetBoard(String boardId, HttpServletRequest request
            , HttpServletResponse response) ;

    //getboard에서 댓글 정보
    List<Board> commentList(String boardId) ;

    //자유게시판 파일다운로드
    ResponseEntity<Object> fileDownload(String boardId) throws IOException;

    //게시글 삭제
     void boardDelete(String boardId) ;

    //게시글에서 파일삭제 버튼클릭시
     void fileDelete(String boardId) ;

    //게시글 수정
    void boardUpdate(MultipartFile uploadFile, Board board) throws Exception;

    //게시글 댓글추가
    void boardCommentInsert(String boardId, String content, String userIdennum) ;

    //게시글 댓글 수정
    void boardCommentUpdate(String boardCommentId
            , String content) ;

    //게시글 댓글 삭제
    void boardCommentDelete(String boardCommentId) ;
}
