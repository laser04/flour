package com.flour.FlourProject.configuration;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

import com.flour.FlourProject.Paging.Paging;
import com.flour.FlourProject.board.dto.BoardDTO;
import com.flour.FlourProject.board.service.BoardService;



@Component
public class BoardConfiguration {
	
	@Autowired
	private BoardService boardService;
	@Autowired
	private Paging page;
	
	
	//boardlist
	public void ConfigurationBoardList(String pageNum,Model model) throws Exception{
		
		//페이지처리 + startRow,pageSize를 반환
		BoardDTO pagedto=boardService.BoardPageCount(); //게시판 총 행의개수
		int boardpagecount=	pagedto.getBoardPagecount();
		HashMap<String,Integer> pageinfo=page.paging(pageNum, model, boardpagecount);
				
		List<BoardDTO> boardList =//인덱스 0부터시작이므로 -1해준다
				boardService.selectBoardList(pageinfo.get("startRow")-1,
						pageinfo.get("pageSize"));
		model.addAttribute("boardList",boardList);
	}
	
	//searchboardlist
	public void ConfigurationSearchgetBoard(String pageNum,Model model
			,BoardDTO dto) throws Exception{
		//검색어 처리(연관검색)
		String searchKeyword="%"+dto.getSearchKeyword()+"%";
		
		//페이지처리 + startRow,pageSize를 반환
		
		
		//제목 검색시에
		if(dto.getSearchCondition().equals("BOARDTITLE")) {
			//전체행의 개수
			BoardDTO pagedto=boardService.BoardSearchTitlePageCount(searchKeyword); //게시판 총 행의개수
			int boardpagecount=	pagedto.getBoardPagecount();
			HashMap<String,Integer> pageinfo=page.paging(pageNum, model, boardpagecount);
			
			List<BoardDTO> boardList =boardService.searchBoardTitle(searchKeyword
					,pageinfo.get("startRow")-1
					,pageinfo.get("pageSize"));
			model.addAttribute("boardList",boardList);
		}
		//작성자 검색시에
		else if(dto.getSearchCondition().equals("USERNAME")) {
			//전체행의 개수
			BoardDTO pagedto=boardService.BoardSearchNamePageCount(searchKeyword); //게시판 총 행의개수
			int boardpagecount=	pagedto.getBoardPagecount();
			HashMap<String,Integer> pageinfo=page.paging(pageNum, model, boardpagecount);
			
			List<BoardDTO> boardList =boardService.searchUserName(searchKeyword
					,pageinfo.get("startRow")-1
					,pageinfo.get("pageSize"));
			//검색했을때 정보보내기(페이지 눌렀을때 다시 정보 보내기 위함)
			model.addAttribute("boardList",boardList);
		}
		model.addAttribute("searchKeyword",dto.getSearchKeyword());
		model.addAttribute("searchCondition",dto.getSearchCondition());
		//뭔가잘못됨 이런경우가 있을까?
		/*
		 * else { System.out.println("뭔가잘못됐다 확인해봐 여긴 configuration부분이야"); List<BoardDTO>
		 * boardList =//인덱스 0부터시작이므로 -1해준다
		 * boardService.selectBoardList(pageinfo.get("startRow")-1,
		 * pageinfo.get("pageSize")); model.addAttribute("boardList",boardList);
		 * 
		 * }
		 */
		
	}
	
	
	
}
