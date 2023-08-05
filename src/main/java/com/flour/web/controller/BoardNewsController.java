package com.flour.web.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.flour.web.domain.BoardNews;
import com.flour.web.service.BoardNewsService;


@Controller
public class BoardNewsController {
	
	@Autowired
	private BoardNewsService boardNewsService;
	@Autowired
	private HttpSession session;
	
	//뉴스 게시판 첫화면 
	@GetMapping("/boardnewslist") //자유게시판 이동
	public ModelAndView getBoardNewslist(HttpServletRequest request,Model model) 
			throws Exception{
		
		//%%%%%%%%임시 세션
		session.setAttribute("USERID", "1");
			
		//페이징처리
		String pageNum=request.getParameter("pageNum");
		HashMap<String,Integer> pageinfo=boardNewsService.pageInfo(model, pageNum);
		int startRow=pageinfo.get("startRow")-1;//인덱스 0부터시작이므로 -1해준다
		int pageSize=pageinfo.get("pageSize");
		
		List<BoardNews> boardNewsList
			=boardNewsService.selectBoardNewsList(startRow,pageSize);

		ModelAndView mav=new ModelAndView("/board/Board_News_List");
		mav.addObject("boardNewsList",boardNewsList);
		
		return mav;
	}
	
	//게시판 검색눌렀을시
	@GetMapping("/boardnewslist/search")
	public ModelAndView searchgetBoardNewslist(HttpServletRequest request,BoardNews dto, Model model) throws Exception{

		String pageNum=request.getParameter("pageNum");
		ModelAndView mav=new ModelAndView("/Board_News_Search_List");
		
		//검색어 처리(연관검색)
		String searchKeyword="%"+dto.getSearchKeyword()+"%";
		
		//제목 검색시에
		if(dto.getSearchCondition().equals("BOARDNEWSTITLE")) {
		HashMap<String,Integer> pageTitleinfo
			=boardNewsService.pageTitleInfo(model, pageNum, dto);
		//제목검색시 페이징정보
		int tstartRow=pageTitleinfo.get("startRow")-1;//인덱스 0부터시작이므로 -1해준다
		int tpageSize=pageTitleinfo.get("pageSize");
		
		List<BoardNews> boardNewsList 
			= boardNewsService.BoardTitleSearchPageCount(searchKeyword,tstartRow,tpageSize);
		mav.addObject("boardNewsList",boardNewsList);
			}
		
		//작성자 검색시에
		else if(dto.getSearchCondition().equals("USERNAME")) {
		HashMap<String,Integer> pageWriterinfo
			=boardNewsService.pageWriterInfo(model, pageNum, dto);	
		//작성자검색시 페이징정보
		int wstartRow=pageWriterinfo.get("startRow")-1;//인덱스 0부터시작이므로 -1해준다
		int wpageSize=pageWriterinfo.get("pageSize");	
		
		List<BoardNews> boardNewsList 
			= boardNewsService.BoardWriterSearchPageCount(searchKeyword,wstartRow,wpageSize);
		mav.addObject("boardNewsList",boardNewsList);	
		}
		else {
			System.out.println("SearchCondition의 값이 요청이안보내졌습니다"); 
		}
		
		mav.addObject("searchKeyword",dto.getSearchKeyword());
		mav.addObject("searchCondition",dto.getSearchCondition());
		return mav; 
	}
	
	
	// 게시판 게시글들어가기
	@GetMapping("/boardnewsget")
	
	public ModelAndView MoveGetBoardNews(@RequestParam("BOARDNEWSID") String BOARDNEWSID
			,HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		ModelAndView mav=new ModelAndView("Board_News_Get");
		
		BoardNews dto=boardNewsService.MoveGetBoardNews(BOARDNEWSID,request, response);
		List<BoardNews> commentlist=boardNewsService.CommentList(BOARDNEWSID);
		mav.addObject("boardNews",dto);
		mav.addObject("boardNewsList",commentlist);
		
		return mav;

	}
	
	//boardget에서 파일 다운로드
	@GetMapping("/fileDownloadnews")
	public ResponseEntity<Object> fileDownload(@RequestParam("BOARDNEWSID")String BOARDNEWSID)throws Exception{
		return boardNewsService.fileDownload(BOARDNEWSID);
	}
	
	//게시글 삭제
	@GetMapping("/boardnewsdelete")
	public String BoardNewsDelete(@RequestParam("BOARDNEWSID")String BOARDNEWSID) throws Exception{
		boardNewsService.BoardNewsDelete(BOARDNEWSID);
		return "redirect:boardnewslist";
	}

	//게시글 수정
	@PostMapping("/boardnewsupdate")
	public String BoardNewsUpdate(@RequestParam("uploadfile")MultipartFile uploadfile,BoardNews dto) throws Exception{
		
		boardNewsService.BoardNewsUpdate(uploadfile,dto);
		int boardnewsid=dto.getBOARDNEWSID(); //수정후 수정한 게시글로 이동하기위함
		return "redirect:boardnewsget?BOARDNEWSID="+boardnewsid;
	}
	//게시글에서 파일삭제 버튼클릭시
	@GetMapping("/filedeletenews")
	public String FileDelete(@RequestParam("BOARDNEWSID")String BOARDNEWSID)throws Exception{
		boardNewsService.FileDelete(BOARDNEWSID);
		int boardnewsid =Integer.parseInt(BOARDNEWSID);
		return "redirect:boardnewsget?BOARDNEWSID="+boardnewsid;
	}
	
	//게시글 댓글 추가
	@PostMapping("/boardnewscomment")
	public String BoardNewsCommentInsert(@RequestParam("BOARDNEWSID")String BOARDNEWSID
			,@RequestParam("BOARDNEWSCOMMENTCONTENT")String BOARDNEWSCOMMENTCONTENT)
					throws Exception{
		
		//%%%%%%%%%임시 세션으로함
		String USERID=(String)session.getAttribute("USERID");
		
		
		boardNewsService.BoardNewsCommentInsert(USERID,BOARDNEWSID, BOARDNEWSCOMMENTCONTENT);	
		
		int boardnewsid =Integer.parseInt(BOARDNEWSID);
		return "redirect:boardnewsget?BOARDNEWSID="+boardnewsid;
	}
	
	//게시글 댓글 수정	
		@GetMapping("/boardnewscommentupdate")
		public String BoardNewsCommentUpdate(@RequestParam("BOARDNEWSID")String BOARDNEWSID
				,@RequestParam("BOARDNEWSCOMMENTID")String BOARDNEWSCOMMENTID
				,@RequestParam("BOARDNEWSCOMMENTCONTENT")String BOARDNEWSCOMMENTCONTENT)throws Exception{
			
			boardNewsService.BoardNewsCommentUpdate(BOARDNEWSCOMMENTID, BOARDNEWSCOMMENTCONTENT);
			int boardnewsid =Integer.parseInt(BOARDNEWSID);
			return "redirect:boardnewsget?BOARDNEWSID="+boardnewsid;
		}
	//게시글 댓글 삭제	
	@GetMapping("/boardnewscommentdelete")
	public String BoardNewsCommentDelete(@RequestParam("BOARDNEWSID")String BOARDNEWSID
			,@RequestParam("BOARDNEWSCOMMENTID")String BOARDNEWSCOMMENTID)throws Exception{
		
		boardNewsService.BoardNewsCommentDelete(BOARDNEWSCOMMENTID);
		int boardnewsid =Integer.parseInt(BOARDNEWSID);
		return "redirect:boardnewsget?BOARDNEWSID="+boardnewsid;
	}
		
}
