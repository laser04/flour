package com.flour.web.service;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.flour.web.domain.Board;
import com.flour.web.mapper.BoardMapper;
import com.flour.web.utils.FileUpload;
import com.flour.web.utils.Paging;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;


@Slf4j
@Service
@Component
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService{

	@Autowired
    private BoardMapper boardMapper;
	@Autowired
	private Paging page;
	@Autowired
	private ServletContext servletContext;
	@Autowired
	private FileUpload fileupload;


	//boardlist
	@Override
	public List<Board> selectBoardList(int startRow, int pageSize)  {
        return boardMapper.selectBoardList(startRow,pageSize);
	}
	
	//페이징처리정보들
	@Override
	public HashMap<String, Integer> pageInfo(Model model, String pageNum) throws Exception{
		//페이지처리 + startRow,pageSize를 반환
		 //게시판 총 행의개수
		int boardPageCount=	boardMapper.BoardPageCount();
        return page.paging(pageNum, model, boardPageCount);
	}
	
	
	//제목검색페이지 행의 총개수
	@Override
	public List<Board> boardTitleSearchPageCount(String searchKeyword
			, int tstartRow, int tpageSize) {
			
			return boardMapper.searchBoardTitle(searchKeyword
					,tstartRow,tpageSize);
	}
	
	//작성자검색페이지 행의 총개수
	@Override
	public List<Board> boardWriterSearchPageCount(String searchKeyword
			, int wstartRow, int wpageSize) {

			return boardMapper.searchUserName(searchKeyword
					,wstartRow,wpageSize);
		}
	
	//제목페이징처리정보들
	@Override
	public HashMap<String, Integer> pageTitleInfo(Model model, String pageNum, Board board) throws Exception {
		//검색어 처리(연관검색)
		String searchKeyword="%"+board.getSearchKeyword()+"%";
		//전체행의 개수
		Board pageboard= boardMapper.BoardSearchTitlePageCount(searchKeyword); //게시판 총 행의개수
		int boardPageCount=	pageboard.getBoardPageCount();

        return page.paging(pageNum, model, boardPageCount);
	}
	
	//작성자페이징처리정보들
	@Override
	public HashMap<String, Integer> pageWriterInfo(Model model, String pageNum, Board board) throws Exception {
		//검색어 처리(연관검색)
		String searchKeyword="%"+board.getSearchKeyword()+"%";
		//전체행의 개수
		Board pageboard= boardMapper.BoardSearchNamePageCount(searchKeyword); //게시판 총 행의개수
		int boardPageCount=	pageboard.getBoardPageCount();

        return page.paging(pageNum, model, boardPageCount);
	}
	
		

	//move_boardinsert 기존 회원정보 보내는기능
	@Override
	public Board moveBoardInsert(String userIdennum)  {
		//%%%%%%%%%임시 세션으로함
        //직책이 관리자가 아닐결우
//		if(board.getUserRole() == null) {
//			board.setUSERADMIN("일반");
//		}
		return boardMapper.moveBoardInsert(userIdennum);
	}

	
	
	//boardlist에 새글등록**(파일 입력)
	@Override
	public void boardInsert(Board board
			, MultipartFile uploadFile, String userIdennum) throws Exception {
		//uuid 를 이용해 unique한 파일이름을 만들어 준다
		String contextPath = servletContext.getRealPath("/FileStorage/");
		//파일 업로드
		board=fileupload.fileupload(contextPath, uploadFile, board);
		
		board.setUserIdennum(userIdennum); //부가정보 입력(기획팀등록일등등)을 위함
		
		boardMapper.BoardInsert(board);
	}

	
	//getborad에 이동
	@Override
	public Board moveGetBoard(String boardId, HttpServletRequest request
			, HttpServletResponse response)  {
		
			Board board=boardMapper.MoveGetBoard(boardId);
			
		
			//조회수 증가 기능(쿠키를 이용하여 중복방지해둠)	
			Cookie oldCookie = null;
		    Cookie[] cookies = request.getCookies();
		    if (cookies != null) {
		        for (Cookie cookie : cookies) {
		            if (cookie.getName().equals("postView")) {
		                oldCookie = cookie;
		            }
		        }
		    }
		    if (oldCookie != null) {
		        if (!oldCookie.getValue().contains("[" + boardId.toString() + "]")) {
		        	boardMapper.BoardCountIncrease(boardId);//조회수 증가
		            oldCookie.setValue(oldCookie.getValue() + "_[" + boardId + "]");
		            oldCookie.setPath("/");
		            oldCookie.setMaxAge(60 * 60 * 24);
		            response.addCookie(oldCookie);
		        }
		    } else {
		    	boardMapper.BoardCountIncrease(boardId);//조회수 증가
		        Cookie newCookie = new Cookie("postView","[" + boardId + "]");
		        newCookie.setPath("/");
		        newCookie.setMaxAge(60 * 60 * 24);
		        response.addCookie(newCookie);
		    }
			return board;
	}

		//getboard에서 댓글 정보
		@Override
		public List<Board> commentList(String boardId)  {

            return boardMapper.GetBoardAllComment(boardId);
		}

		//파일 다운로드 
		@Override
		public ResponseEntity<Object> fileDownload(String boardId) throws IOException {
			
			//데이터베이스 저장을 위해 board에 filename과 filepath저장
			String contextPath = servletContext.getRealPath("/FileStorage/");
			Board fileboard=boardMapper.MoveGetBoard(boardId);
			
			Path path=Paths.get(contextPath+"/"+fileboard.getBoardFilePath());
			HttpHeaders headers = new HttpHeaders();
			
			headers.setContentDisposition(ContentDisposition.builder("attachment").
					filename(fileboard.getBoardFilePath(),StandardCharsets.UTF_8 ).build());

			Resource resource =  new InputStreamResource(Files.newInputStream(path));
			
			
			return new ResponseEntity<>(resource, headers, HttpStatus.OK);
		}
		
		//게시글 삭제 
		@Override
		public void boardDelete(String boardId)  {
			boardMapper.BoardDelete(boardId);
			//게시글삭제시 해당게시글댓글삭제
			boardMapper.BoardAllCommentDelete(boardId);
		}
		
		//게시글에서 파일삭제 버튼클릭시
		@Override
		public void fileDelete(String boardId)  {
			boardMapper.FileDelete(boardId);
		}


		//게시글 수정
		@Override
		public void boardUpdate(MultipartFile uploadFile
				, Board board) throws Exception {
			
			//uuid 를 이용해 unique한 파일이름을 만들어 준다
			String contextPath = servletContext.getRealPath("/FileStorage/");
			//파일 업로드
			board = fileupload.fileupload(contextPath,uploadFile, board);
			boardMapper.BoardUpdate(board);
		
		}


		//댓글입력
		@Override
		public void boardCommentInsert(String boardId, String content
				,String userIdennum)  {

            boardMapper.BoardCommentInsert(boardId, content, userIdennum);
			
		}


		//게시글 댓글 수정
		@Override
		public void boardCommentUpdate(String boardCommentId
				, String content)  {
			//댓글 수정
			boardMapper.BoardCommentUpdate(boardCommentId, content);
		}


		//게시글 댓글 삭제		
		@Override
		public void boardCommentDelete(String boardCommentId)  {
			boardMapper.BoardCommentDelete(boardCommentId);
		}

		

	
}
