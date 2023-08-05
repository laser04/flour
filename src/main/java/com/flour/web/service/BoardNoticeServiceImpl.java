package com.flour.web.service;

import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.flour.web.utils.FileUploadNotice;
import com.flour.web.utils.Paging;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.flour.web.domain.BoardNotice;
import com.flour.web.mapper.BoardNoticeMapper;


@Service
public class BoardNoticeServiceImpl implements BoardNoticeService{

	@Autowired
    private  BoardNoticeMapper boardNoticeMapper;
	@Autowired
	private Paging page;
	@Autowired
	private ServletContext servletContext;
	@Autowired
	private FileUploadNotice fileupload;
	
	//boardlist
	@Override
	public List<BoardNotice> selectBoardNoticeList(int startRow, int pageSize) throws Exception{

		List<BoardNotice> boardNoticeList =boardNoticeMapper.selectBoardNoticeList(startRow,pageSize);
		return boardNoticeList;
	}
	//페이징처리정보들
	@Override
	public HashMap<String, Integer> pageInfo(Model model,String pageNum) throws Exception {
		//페이지처리 + startRow,pageSize를 반환
		BoardNotice pagedto=boardNoticeMapper.BoardNoticePageCount(); //게시판 총 행의개수
		int boardnoticepagecount=pagedto.getBoardNoticePagecount();
		HashMap<String,Integer> pageinfo=page.paging(pageNum, model, boardnoticepagecount);
			
		return pageinfo;
	}
	

	//제목검색페이지 행의 총개수
	@Override
	public List<BoardNotice> BoardTitleSearchPageCount(String searchKeyword
			,int tstartRow, int tpageSize ) throws Exception{

		List<BoardNotice> boardList =boardNoticeMapper.searchBoardNoticeTitle(searchKeyword
				,tstartRow,tpageSize);
			
			return  boardList;
	}
	
	//작성자검색페이지 행의 총개수
	@Override
	public List<BoardNotice> BoardWriterSearchPageCount(String searchKeyword
			,int wstartRow, int wpageSize) throws Exception{
			
		List<BoardNotice> boardList =boardNoticeMapper.searchUserName(searchKeyword
				,wstartRow,wpageSize);

			return  boardList;
		}
	
	//제목페이징처리정보들
	@Override
	public HashMap<String, Integer> pageTitleInfo(Model model,String pageNum,BoardNotice dto) throws Exception {
		//검색어 처리(연관검색)
		String searchKeyword="%"+dto.getSearchKeyword()+"%";
		//전체행의 개수
		BoardNotice pagedto= boardNoticeMapper.BoardNoticeSearchTitlePageCount(searchKeyword); //게시판 총 행의개수
		int boardpagecount=	pagedto.getBoardNoticePagecount();
		HashMap<String,Integer> pageinfo=page.paging(pageNum, model, boardpagecount);
						
		return pageinfo;
	}
	
	//작성자페이징처리정보들
	@Override
	public HashMap<String, Integer> pageWriterInfo(Model model,String pageNum,BoardNotice dto) throws Exception {
		//검색어 처리(연관검색)
		String searchKeyword="%"+dto.getSearchKeyword()+"%";
		//전체행의 개수
		BoardNotice pagedto= boardNoticeMapper.BoardNoticeSearchNamePageCount(searchKeyword); //게시판 총 행의개수
		int boardpagecount=	pagedto.getBoardNoticePagecount();
		HashMap<String,Integer> pageinfo=page.paging(pageNum, model, boardpagecount);
						
		return pageinfo;
	}

	
	//boardlist에 새글등록**(파일 입력)
	@Override
	public void BoardNoticeInsert(String USERID,BoardNotice dto
			,MultipartFile uploadfile) throws Exception{
		//uuid 를 이용해 unique한 파일이름을 만들어 준다
		String contextPath = servletContext.getRealPath("/FileStorage/");
		//파일 업로드
		dto=fileupload.fileupload(contextPath,uploadfile, dto);
		dto.setUserIdennum(USERID); //부가정보 입력(기획팀등록일등등)을 위함
		boardNoticeMapper.BoardNoticeInsert(dto);	
	}
	
	//getborad에 이동
	@Override
	public BoardNotice MoveGetBoardNotice(String BOARDNOTICEID,HttpServletRequest request
			,HttpServletResponse response) throws Exception {
		
			BoardNotice dto=boardNoticeMapper.MoveGetBoardNotice(BOARDNOTICEID);
			
			//조회수 증가 기능(쿠키를 이용하여 중복방지해둠)	
			Cookie oldCookie = null;
		    Cookie[] cookies = request.getCookies();
		    if (cookies != null) {
		        for (Cookie cookie : cookies) {
		            if (cookie.getName().equals("postView3")) {
		                oldCookie = cookie;
		            }
		        }
		    }
		    if (oldCookie != null) {
		        if (!oldCookie.getValue().contains("[" + BOARDNOTICEID.toString() + "]")) {
		        	boardNoticeMapper.BoardNoticeCountIncrease(BOARDNOTICEID);//조회수 증가
		            oldCookie.setValue(oldCookie.getValue() + "_[" + BOARDNOTICEID + "]");
		            oldCookie.setPath("/");
		            oldCookie.setMaxAge(60 * 60 * 24);
		            response.addCookie(oldCookie);
		        }
		    } else {
		    	boardNoticeMapper.BoardNoticeCountIncrease(BOARDNOTICEID);//조회수 증가
		        Cookie newCookie = new Cookie("postView3","[" + BOARDNOTICEID + "]");
		        newCookie.setPath("/");
		        newCookie.setMaxAge(60 * 60 * 24);
		        response.addCookie(newCookie);
		    }
		    return dto;
		    
		
		}
	
		//getboard에서 댓글 정보
		@Override
		public List<BoardNotice> CommentList(String BOARDNOTICEID) throws Exception {
		List<BoardNotice> commentlist=
				boardNoticeMapper.GetBoardNoticeAllComment(BOARDNOTICEID); //댓글 테이블

			return commentlist;
		}
	
	

		//파일 다운로드 
		@Override
		public ResponseEntity<Object> fileDownload(String BOARDNOTICEID) throws Exception {
			
			//데이터베이스 저장을 위해 dto에 filename과 filepath저장
			String contextPath = servletContext.getRealPath("/FileStorage/");
			BoardNotice filedto=boardNoticeMapper.MoveGetBoardNotice(BOARDNOTICEID);
			
			Path path=Paths.get(contextPath+"/"+filedto.getBOARDNOTICEFILEPATH());
			HttpHeaders headers = new HttpHeaders();
			
			headers.setContentDisposition(ContentDisposition.builder("attachment").
					filename(filedto.getBOARDNOTICEFILENAME(),StandardCharsets.UTF_8 ).build());

			Resource resource =  new InputStreamResource(Files.newInputStream(path));
			System.out.println("resource: "+resource);
			
			return new ResponseEntity<Object>(resource, headers, HttpStatus.OK);
		}
		
		//게시글 삭제 
		@Override
		public void BoardNoticeDelete(String BOARDNOTICEID) throws Exception {
			boardNoticeMapper.BoardNoticeDelete(BOARDNOTICEID);
			//게시글삭제시 해당게시글댓글삭제
			boardNoticeMapper.BoardNoticeAllCommentDelete(BOARDNOTICEID);
		}
		
		//게시글에서 파일삭제 버튼클릭시
		@Override
		public void FileDelete(String BOARDNOTICEID) throws Exception {
			boardNoticeMapper.FileDelete(BOARDNOTICEID);
		}


		//게시글 수정
		@Override
		public void BoardNoticeUpdate(MultipartFile uploadfile
				,BoardNotice dto) throws Exception {
			
			//uuid 를 이용해 unique한 파일이름을 만들어 준다
			String contextPath = servletContext.getRealPath("/FileStorage/");
			//파일 업로드
			dto=fileupload.fileupload(contextPath,uploadfile, dto);
			boardNoticeMapper.BoardNoticeUpdate(dto);
		
		}

		//댓글입력
		@Override
		public void BoardNoticeCommentInsert(String USERID, String BOARDNOTICEID, String BOARDNOTICECOMMENTCONTENT) throws Exception {
			
			String BOARDNOTICECOMMENTUSERID=USERID;
			boardNoticeMapper.BoardNoticeCommentInsert(BOARDNOTICEID, BOARDNOTICECOMMENTCONTENT, BOARDNOTICECOMMENTUSERID);	
		}

		//게시글 댓글 수정
		@Override
		public void BoardNoticeCommentUpdate(String BOARDNOTICECOMMENTID
				,String BOARDNOTICECOMMENTCONTENT) throws Exception {
			//댓글 수정
			boardNoticeMapper.BoardNoticeCommentUpdate(BOARDNOTICECOMMENTID, BOARDNOTICECOMMENTCONTENT);	
		}

		//게시글 댓글 삭제		
		@Override
		public void BoardNoticeCommentDelete(String BOARDNOTICECOMMENTID) throws Exception {
			boardNoticeMapper.BoardNoticeCommentDelete(BOARDNOTICECOMMENTID);	
		}
		
		//공지 인덱스 정보
		@Override
		public List<BoardNotice> indexBoardNotice() throws Exception {
			
			List<BoardNotice> boardnotice=boardNoticeMapper.indexBoardNotice();
			return boardnotice;
		}


}
