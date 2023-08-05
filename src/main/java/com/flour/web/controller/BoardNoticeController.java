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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.flour.web.domain.BoardNotice;
import com.flour.web.service.BoardNoticeService;



@Controller
public class BoardNoticeController {
	
	@Autowired
	private BoardNoticeService boardNoticeService;
	@Autowired
	private HttpSession session;
	
	//자유 게시판 첫화면 
	@GetMapping("/boardnoticelist") //자유게시판 이동
	public ModelAndView getBoardNoticelist(HttpServletRequest request,Model model) 
			throws Exception{
		
		//%%%%%%%%임시 세션
		session.setAttribute("USERID", "1");
			
		//페이징처리
		String pageNum=request.getParameter("pageNum");
		HashMap<String,Integer> pageinfo=boardNoticeService.pageInfo(model, pageNum);
		int startRow=pageinfo.get("startRow")-1;//인덱스 0부터시작이므로 -1해준다
		int pageSize=pageinfo.get("pageSize");
		
		List<BoardNotice> boardNoticeList
			=boardNoticeService.selectBoardNoticeList(startRow,pageSize);

		ModelAndView mav=new ModelAndView("/board/Board_Notice_List");
		mav.addObject("boardNoticeList",boardNoticeList);//
		
		return mav;

	}
	
	//게시판 검색눌렀을시
	@GetMapping("/boardnoticelist/search")
	public ModelAndView searchgetBoardNoticelist(HttpServletRequest request,BoardNotice dto, Model model) throws Exception{
		
		String pageNum=request.getParameter("pageNum");
		ModelAndView mav=new ModelAndView("/board/Board_Notice_Search_List");
		
		//검색어 처리(연관검색)
		String searchKeyword="%"+dto.getSearchKeyword()+"%";
		
		//제목 검색시에
		if(dto.getSearchCondition().equals("BOARDNOTICETITLE")) {
		HashMap<String,Integer> pageTitleinfo
			=boardNoticeService.pageTitleInfo(model, pageNum, dto);
		//제목검색시 페이징정보
		int tstartRow=pageTitleinfo.get("startRow")-1;//인덱스 0부터시작이므로 -1해준다
		int tpageSize=pageTitleinfo.get("pageSize");
		
		List<BoardNotice> boardNoticeList 
			= boardNoticeService.BoardTitleSearchPageCount(searchKeyword,tstartRow,tpageSize);
		mav.addObject("boardNoticeList",boardNoticeList);
			}
		
		//작성자 검색시에
		else if(dto.getSearchCondition().equals("USERNAME")) {
		HashMap<String,Integer> pageWriterinfo
			=boardNoticeService.pageWriterInfo(model, pageNum, dto);	
		//작성자검색시 페이징정보
		int wstartRow=pageWriterinfo.get("startRow")-1;//인덱스 0부터시작이므로 -1해준다
		int wpageSize=pageWriterinfo.get("pageSize");	
		
		List<BoardNotice> boardNoticeList 
			= boardNoticeService.BoardWriterSearchPageCount(searchKeyword,wstartRow,wpageSize);
		mav.addObject("boardNoticeList",boardNoticeList);	
		}
		else {
			System.out.println("SearchCondition의 값이 요청이안보내졌습니다"); 
		}
		
		mav.addObject("searchKeyword",dto.getSearchKeyword());
		mav.addObject("searchCondition",dto.getSearchCondition());
		return mav; 
		
		
	}
	

	// 게시판 게시글들어가기
	@GetMapping("/boardnoticeget")
	public ModelAndView MoveGetBoardNotice(@RequestParam("BOARDNOTICEID") String BOARDNOTICEID, HttpServletRequest request, HttpServletResponse response) throws Exception{

		ModelAndView mav=new ModelAndView("/board/Board_Notice_Get");
		
		BoardNotice dto=boardNoticeService.MoveGetBoardNotice(BOARDNOTICEID,request, response);
		List<BoardNotice> commentlist=boardNoticeService.CommentList(BOARDNOTICEID);
		mav.addObject("boardNotice",dto);
		mav.addObject("boardNoticeList",commentlist);
		
		return mav;
	}
	
	//boardget에서 파일 다운로드
	@GetMapping("/fileDownloadnotice")
	public ResponseEntity<Object> fileDownload(@RequestParam("BOARDNOTICEID")String BOARDNOTICEID)throws Exception{
		return boardNoticeService.fileDownload(BOARDNOTICEID);
	}
	
	//게시글 삭제
	@GetMapping("/boardnoticedelete")
	public String BoardNoticeDelete(@RequestParam("BOARDNOTICEID")String BOARDNOTICEID) throws Exception{
		boardNoticeService.BoardNoticeDelete(BOARDNOTICEID);
		return "redirect:boardnoticelist";
	}

	//게시글 수정
	@RequestMapping("/boardnoticeupdate")
	public String BoardNoticeUpdate(@RequestParam("uploadfile")MultipartFile uploadfile,BoardNotice dto) throws Exception{
		
		boardNoticeService.BoardNoticeUpdate(uploadfile,dto);
		int boardnoticeid=dto.getBOARDNOTICEID(); //수정후 수정한 게시글로 이동하기위함
		return "redirect:boardnoticeget?BOARDNOTICEID="+boardnoticeid;
	}
	
	//게시글에서 파일삭제 버튼클릭시
	@GetMapping("/filedeletenotice")
	public String FileDelete(@RequestParam("BOARDNOTICEID")String BOARDNOTICEID)throws Exception{
		boardNoticeService.FileDelete(BOARDNOTICEID);
		int boardnoticeid =Integer.parseInt(BOARDNOTICEID);
		return "redirect:boardnoticeget?BOARDNOTICEID="+boardnoticeid;
	}
	
	//게시글 댓글 추가
	@PostMapping("/boardnoticecomment")
	public String BoardNoticeCommentInsert(@RequestParam("BOARDNOTICEID")String BOARDNOTICEID
			,@RequestParam("BOARDNOTICECOMMENTCONTENT")String BOARDNOTICECOMMENTCONTENT)
					throws Exception{
		//%%%%%%%%%임시 세션으로함
		String USERID=(String)session.getAttribute("USERID");
	
		boardNoticeService.BoardNoticeCommentInsert(USERID,BOARDNOTICEID, BOARDNOTICECOMMENTCONTENT);	
		int boardnoticeid =Integer.parseInt(BOARDNOTICEID);
		return "redirect:boardnoticeget?BOARDNOTICEID="+boardnoticeid;
	}
	
	//게시글 댓글 수정	
	@GetMapping("/boardnoticecommentupdate")
	public String BoardNoticeCommentUpdate(@RequestParam("BOARDNOTICEID")String BOARDNOTICEID
			,@RequestParam("BOARDNOTICECOMMENTID")String BOARDNOTICECOMMENTID
			,@RequestParam("BOARDNOTICECOMMENTCONTENT")String BOARDNOTICECOMMENTCONTENT)throws Exception{
		
		boardNoticeService.BoardNoticeCommentUpdate(BOARDNOTICECOMMENTID, BOARDNOTICECOMMENTCONTENT);
		int boardnoticeid =Integer.parseInt(BOARDNOTICEID);
		return "redirect:boardnoticeget?BOARDNOTICEID="+boardnoticeid;
	}
	//게시글 댓글 삭제	
	@GetMapping("/boardnoticecommentdelete")
	public String BoardNoticeCommentDelete(@RequestParam("BOARDNOTICEID")String BOARDNOTICEID
			,@RequestParam("BOARDNOTICECOMMENTID")String BOARDNOTICECOMMENTID)throws Exception{
		
		boardNoticeService.BoardNoticeCommentDelete(BOARDNOTICECOMMENTID);
		int boardnoticeid =Integer.parseInt(BOARDNOTICEID);
		return "redirect:boardnoticeget?BOARDNOTICEID="+boardnoticeid;
	}
		
}
