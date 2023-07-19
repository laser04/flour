package com.flour.FlourProject.board.controller;


import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.flour.FlourProject.board.dto.BoardDTO;
import com.flour.FlourProject.board.service.BoardService;
import com.flour.FlourProject.configuration.BoardConfiguration;



@Controller
public class BoardController {
	
	@Autowired //없애라
	private BoardService boardService;
	
	//페이징하는 클래스
	@Autowired 
	private BoardConfiguration boardConfiguration;
	
	
	@GetMapping("/boardlist") //자유게시판 이동
	public String  getBoardlist(HttpServletRequest request,Model model) 
			throws Exception{
		
		String pageNum=request.getParameter("pageNum");
		boardConfiguration.ConfigurationBoardList(pageNum, model);
		return "/Board_List";
	}
	
	
	@RequestMapping("/boardlist/search")
	public String  searchgetBoardlist(HttpServletRequest request,BoardDTO dto
			,Model model) throws Exception{
		
		String pageNum=request.getParameter("pageNum");
		boardConfiguration.ConfigurationSearchgetBoard(pageNum, model, dto);
		return "/Board_Search_List"; 
	}
	
	
	@GetMapping("/move_boardinsert")
	public String boardinsert() throws Exception{
		 // 그냥 insert페이지로 이동만
		return "/Board_Insert";
	}
	
	
	
	/*
	@RequestMapping("/getBoardList/search.do")
 	public String getBoardList2(BoardVo vo, Model model) { 		
		 List<BoardVo> boardList=boardService.searchBoard(vo);
		 model.addAttribute("boardList",boardList);
		
		return "getBoardList";
	}
	*/
	
	
	
	
}
