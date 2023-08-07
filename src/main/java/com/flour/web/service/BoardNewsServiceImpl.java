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

import com.flour.web.utils.FileUploadNews;
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

import com.flour.web.domain.BoardNews;
import com.flour.web.mapper.BoardNewsMapper;


@Service
public class BoardNewsServiceImpl implements BoardNewsService{

	@Autowired
    private  BoardNewsMapper boardNewsMapper;
	@Autowired
	private Paging page;
	@Autowired
	private ServletContext servletContext;
	@Autowired
	private FileUploadNews fileupload;
	
	//boardlist
	@Override
	public List<BoardNews> selectBoardNewsList(int startRow, int pageSize) throws Exception{

		List<BoardNews> boardNewsList =boardNewsMapper.selectBoardNewsList(startRow,pageSize);
		return boardNewsList;
	}
	//페이징처리정보들
	@Override
	public HashMap<String, Integer> pageInfo(Model model,String pageNum) throws Exception {
		//페이지처리 + startRow,pageSize를 반환
		BoardNews pagedto=boardNewsMapper.BoardNewsPageCount(); //게시판 총 행의개수
		int boardnewspagecount=	pagedto.getBoardNewsPagecount();
		HashMap<String,Integer> pageinfo=page.paging(pageNum, model, boardnewspagecount);
		
		return pageinfo;
	}
	

		//제목검색페이지 행의 총개수
		@Override
		public List<BoardNews> BoardTitleSearchPageCount(String searchKeyword
				,int tstartRow, int tpageSize ) throws Exception{

			List<BoardNews> boardList =boardNewsMapper.searchBoardNewsTitle(searchKeyword
					,tstartRow,tpageSize);
				
				return  boardList;
		}
		
		//작성자검색페이지 행의 총개수
		@Override
		public List<BoardNews> BoardWriterSearchPageCount(String searchKeyword
				,int wstartRow, int wpageSize) throws Exception{
				
			List<BoardNews> boardList =boardNewsMapper.searchUserName(searchKeyword
					,wstartRow,wpageSize);

				return  boardList;
			}
		
		//제목페이징처리정보들
		@Override
		public HashMap<String, Integer> pageTitleInfo(Model model,String pageNum,BoardNews dto) throws Exception {
			//검색어 처리(연관검색)
			String searchKeyword="%"+dto.getSearchKeyword()+"%";
			//전체행의 개수
			BoardNews pagedto= boardNewsMapper.BoardNewsSearchTitlePageCount(searchKeyword); //게시판 총 행의개수
			int boardpagecount=	pagedto.getBoardNewsPagecount();
			HashMap<String,Integer> pageinfo=page.paging(pageNum, model, boardpagecount);
							
			return pageinfo;
		}
		
		//작성자페이징처리정보들
		@Override
		public HashMap<String, Integer> pageWriterInfo(Model model,String pageNum,BoardNews dto) throws Exception {
			//검색어 처리(연관검색)
			String searchKeyword="%"+dto.getSearchKeyword()+"%";
			//전체행의 개수
			BoardNews pagedto= boardNewsMapper.BoardNewsSearchNamePageCount(searchKeyword); //게시판 총 행의개수
			int boardpagecount=	pagedto.getBoardNewsPagecount();
			HashMap<String,Integer> pageinfo=page.paging(pageNum, model, boardpagecount);
							
			return pageinfo;
		}
	

		//boardlist에 새글등록**(파일 입력)
		@Override
		public void BoardNewsInsert(String USERID,BoardNews dto
				,MultipartFile uploadfile) throws Exception{
			//uuid 를 이용해 unique한 파일이름을 만들어 준다
			String contextPath = servletContext.getRealPath("/FileStorage/");
			//파일 업로드
			dto=fileupload.fileupload(contextPath,uploadfile, dto);
			dto.setUserIdennum(USERID); //부가정보 입력(기획팀등록일등등)을 위함
			boardNewsMapper.BoardNewsInsert(dto);	
		}
		
		//getborad에 이동
		@Override
		public BoardNews MoveGetBoardNews(String BOARDNEWSID,HttpServletRequest request
				,HttpServletResponse response) throws Exception {
			
				BoardNews dto=boardNewsMapper.MoveGetBoardNews(BOARDNEWSID);
				
				
				//조회수 증가 기능(쿠키를 이용하여 중복방지해둠)	
				Cookie oldCookie = null;
			    Cookie[] cookies = request.getCookies();
			    if (cookies != null) {
			        for (Cookie cookie : cookies) {
			            if (cookie.getName().equals("postView22")) {
			                oldCookie = cookie;
			            }
			        }
			    }
			    if (oldCookie != null) {
			        if (!oldCookie.getValue().contains("[" + BOARDNEWSID.toString() + "]")) {
			        	boardNewsMapper.BoardNewsCountIncrease(BOARDNEWSID);//조회수 증가
			            oldCookie.setValue(oldCookie.getValue() + "_[" + BOARDNEWSID + "]");
			            oldCookie.setPath("/");
			            oldCookie.setMaxAge(60 * 60 * 24);
			            response.addCookie(oldCookie);
			        }
			    } else {
			    	boardNewsMapper.BoardNewsCountIncrease(BOARDNEWSID);//조회수 증가
			        Cookie newCookie = new Cookie("postView22","[" + BOARDNEWSID + "]");
			        newCookie.setPath("/");
			        newCookie.setMaxAge(60 * 60 * 24);
			        response.addCookie(newCookie);
			    }
			    
			    return dto;
		}
	
		//getboard에서 댓글 정보
		@Override
		public List<BoardNews> CommentList(String BOARDNEWSID) throws Exception {
			List<BoardNews> commentlist=
					boardNewsMapper.GetBoardNewsAllComment(BOARDNEWSID); //댓글 테이블
				
				return commentlist;
			}

		//파일 다운로드 
		@Override
		public ResponseEntity<Object> fileDownload(String BOARDNEWSID) throws Exception {
			
			//데이터베이스 저장을 위해 dto에 filename과 filepath저장
			String contextPath = servletContext.getRealPath("/FileStorage/");
			BoardNews filedto=boardNewsMapper.MoveGetBoardNews(BOARDNEWSID);
			
			Path path=Paths.get(contextPath+"/"+filedto.getBOARDNEWSFILEPATH());
			HttpHeaders headers = new HttpHeaders();
			
			headers.setContentDisposition(ContentDisposition.builder("attachment").
					filename(filedto.getBOARDNEWSFILENAME(),StandardCharsets.UTF_8 ).build());

			Resource resource =  new InputStreamResource(Files.newInputStream(path));
			System.out.println("resource: "+resource);
			
			return new ResponseEntity<Object>(resource, headers, HttpStatus.OK);
		}
		
		//게시글 삭제 
		@Override
		public void BoardNewsDelete(String BOARDNEWSID) throws Exception {
			boardNewsMapper.BoardNewsDelete(BOARDNEWSID);
			//게시글삭제시 해당게시글댓글삭제
			boardNewsMapper.BoardNewsAllCommentDelete(BOARDNEWSID);
		}
		
		//게시글에서 파일삭제 버튼클릭시
		@Override
		public void FileDelete(String BOARDNEWSID) throws Exception {
			boardNewsMapper.FileDelete(BOARDNEWSID);
		}


		//게시글 수정
		@Override
		public void BoardNewsUpdate(MultipartFile uploadfile
				,BoardNews dto) throws Exception {
			
			//uuid 를 이용해 unique한 파일이름을 만들어 준다
			String contextPath = servletContext.getRealPath("/FileStorage/");
			//파일 업로드
			dto=fileupload.fileupload(contextPath,uploadfile, dto);
			boardNewsMapper.BoardNewsUpdate(dto);
		
		}

		//댓글입력
		@Override
		public void BoardNewsCommentInsert(String USERID
				,String BOARDNEWSID, String BOARDNEWSCOMMENTCONTENT) throws Exception {
			
			String BOARDNEWSCOMMENTUSERID=USERID;
			boardNewsMapper.BoardNewsCommentInsert(BOARDNEWSID, BOARDNEWSCOMMENTCONTENT, BOARDNEWSCOMMENTUSERID);	
		}

		//게시글 댓글 수정
		@Override
		public void BoardNewsCommentUpdate(String BOARDNEWSCOMMENTID
				,String BOARDNEWSCOMMENTCONTENT) throws Exception {
			//댓글 수정
			boardNewsMapper.BoardNewsCommentUpdate(BOARDNEWSCOMMENTID, BOARDNEWSCOMMENTCONTENT);	
		}

		//게시글 댓글 삭제		
		@Override
		public void BoardNewsCommentDelete(String BOARDNEWSCOMMENTID) throws Exception {
			boardNewsMapper.BoardNewsCommentDelete(BOARDNEWSCOMMENTID);	
		}
		
		//공지 인덱스 정보
		@Override
		public List<BoardNews> indexBoardNews() throws Exception {
			
			List<BoardNews> indexboardnews=boardNewsMapper.indexBoardNews();
			return indexboardnews;
		}

}
