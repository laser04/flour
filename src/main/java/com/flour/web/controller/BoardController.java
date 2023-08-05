package com.flour.web.controller;


import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.flour.web.annotation.CurrentUser;
import com.flour.web.domain.Board;
import com.flour.web.domain.Users;
import com.flour.web.service.BoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequiredArgsConstructor
public class BoardController {


    @Autowired
    private BoardService boardService;

    //자유 게시판 첫화면
    @GetMapping("/achieve/board/list/") //자유게시판 이동
    public ModelAndView getBoardList(HttpServletRequest request, Model model) throws Exception {
        String pageNum = request.getParameter("pageNum");
        HashMap<String, Integer> pageInfo = boardService.pageInfo(model, pageNum);
        int startRow = pageInfo.get("startRow") - 1;//인덱스 0부터시작이므로 -1해준다
        int pageSize = pageInfo.get("pageSize");

        List<Board> boardList = boardService.selectBoardList(startRow, pageSize);

        ModelAndView mav = new ModelAndView("/board/Board_List");
        mav.addObject("boardList", boardList);

        return mav;
    }

    //게시판 검색눌렀을시
    @GetMapping("/achieve/board/search/")
    public ModelAndView searchGetBoardList(@RequestParam String pageNum, Board dto
            , Model model) throws Exception {

        ModelAndView mav = new ModelAndView("/board/Board_Search_List");
        //검색어 처리(연관검색)
        String searchKeyword = "%" + dto.getSearchKeyword() + "%";

        //제목 검색시에
        if (dto.getSearchCondition().equals("boardTitle")) {
            HashMap<String, Integer> pageTitleInfo
                    = boardService.pageTitleInfo(model, pageNum, dto);
            //제목검색시 페이징정보
            int tstartRow = pageTitleInfo.get("startRow") - 1;//인덱스 0부터시작이므로 -1해준다
            int tpageSize = pageTitleInfo.get("pageSize");

            List<Board> boardList
                    = boardService.boardTitleSearchPageCount(searchKeyword, tstartRow, tpageSize);
            mav.addObject("boardList", boardList);
        }

        //작성자 검색시에
        else if (dto.getSearchCondition().equals("userName")) {
            HashMap<String, Integer> pageWriterInfo
                    = boardService.pageWriterInfo(model, pageNum, dto);
            //작성자검색시 페이징정보
            int wstartRow = pageWriterInfo.get("startRow") - 1;//인덱스 0부터시작이므로 -1해준다
            int wpageSize = pageWriterInfo.get("pageSize");

            List<Board> boardList
                    = boardService.boardWriterSearchPageCount(searchKeyword, wstartRow, wpageSize);
            mav.addObject("boardList", boardList);
        } else {
            System.out.println("SearchCondition의 값이 요청이 안 보내졌습니다");
        }

        mav.addObject("searchKeyword", dto.getSearchKeyword());
        mav.addObject("searchCondition", dto.getSearchCondition());

        return mav;
    }

    // 글쓰기(insert)페이지로 이동
    @GetMapping("/achieve/board/write/")
    public String moveBoardInsert(@CurrentUser Users users, Model model) {
        Board board = boardService.moveBoardInsert(users.getUserIdennum());
        model.addAttribute("boarddto", board);

        return "/board/Board_Insert";
    }

    //boardlist에 입력(파일포함)
    @PostMapping("/achieve/board/insert/")
    public String boardInsert(@RequestParam("uploadFile") MultipartFile uploadFile
            , Board board, @CurrentUser Users users) throws Exception {
        boardService.boardInsert(board, uploadFile, users.getUserIdennum());
        return "redirect:/achieve/board/list/";
    }


    // 게시판 게시글들어가기
    @GetMapping("/achieve/board/read/{boardId}")
    public ModelAndView MoveGetBoard(@PathVariable String boardId, HttpServletRequest request,
                                     HttpServletResponse response) {

        ModelAndView mav = new ModelAndView("/board/Board_Get");

        Board board = boardService.moveGetBoard(boardId, request, response);
        List<Board> commentList = boardService.commentList(boardId);
        mav.addObject("board", board);
        mav.addObject("boardList", commentList);

        return mav;
    }

    //boardget에서 파일 다운로드
    @GetMapping("/fileDownload")
    public ResponseEntity<Object> fileDownload(@RequestParam("boardId") String boardId) throws IOException {
        return boardService.fileDownload(boardId);
    }

    //게시글 삭제
    @DeleteMapping("/achieve/board/delete/{boardId}")
    public String BoardDelete(@PathVariable String boardId) {
        boardService.boardDelete(boardId);
        return "redirect:/achieve/board/list";
    }

    //게시글 수정
    @PostMapping("/achieve/board/update")
    public String BoardUpdate(@RequestParam("uploadfile") MultipartFile uploadfile
            , Board dto) throws Exception {
        boardService.boardUpdate(uploadfile, dto);
        int boardid = dto.getBoardId(); //수정후 수정한 게시글로 이동하기위함
        return "redirect:/achieve/board/read" + boardid;
    }

    //게시글에서 파일삭제 버튼클릭시
    @GetMapping("/filedelete")
    public String FileDelete(@RequestParam("boardId") String boardId) {
        boardService.fileDelete(boardId);
        return "redirect:/achieve/board/read" + boardId;
    }

    //게시글 댓글 추가
    @PostMapping("/achieve/board/comment/insert/{boardId}")
    public String BoardCommentInsert(@PathVariable String boardId,
                                     @RequestParam("content") String content,
                                     @CurrentUser Users users) {

        boardService.boardCommentInsert(boardId, content, users.getUserIdennum());

        return "redirect:/achieve/board/read/" + boardId;
    }

    //게시글 댓글 수정
    @GetMapping("/achieve/board/comment/update/{boardId}/{boardCommentId}/{content}")
    public String BoardCommentUpdate(@PathVariable String boardId,
                                     @PathVariable String boardCommentId,
                                     @PathVariable String content) {

        boardService.boardCommentUpdate(boardCommentId, content);
        System.out.println(content+"dkssu");
        return "redirect:/achieve/board/read/" + boardId;
    }

    //게시글 댓글 삭제
    @PostMapping("/achieve/board/comment/delete/{boardId}/{boardCommentId}")
    public String BoardCommentDelete(@PathVariable String boardId,
                                     @PathVariable String boardCommentId) {

        boardService.boardCommentDelete(boardCommentId);
        return "redirect:/achieve/board/read/" + boardId;
    }
}