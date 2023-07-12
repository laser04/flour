package com.flour.FlourProject;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;

import com.flour.FlourProject.board.dto.BoardDTO;

@Controller
public class test {
	@GetMapping("/hello")
	  public String hisi() {	
		return "Board_List";
	  }
}
