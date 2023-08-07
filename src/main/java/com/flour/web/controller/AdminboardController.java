package com.flour.web.controller;



import com.flour.web.annotation.CurrentUser;
import com.flour.web.domain.Users;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.flour.web.domain.BoardNews;
import com.flour.web.domain.BoardNotice;
import com.flour.web.service.BoardNewsService;
import com.flour.web.service.BoardNoticeService;

@Controller
@RequiredArgsConstructor
public class AdminboardController {

	@Autowired
	private BoardNewsService boardNewsService;
	@Autowired
	private BoardNoticeService boardNoticeService;

	
	//adminboardnewslist에 입력(파일포함)
		@PostMapping("/admin/boardnewsinsert")
		public String boardnewsinsert(@RequestParam("uploadfile")MultipartFile uploadfile, BoardNews dto, @CurrentUser Users users)
				throws Exception{
			boardNewsService.BoardNewsInsert(users.getUserIdennum(),dto,uploadfile);
			return "redirect:/boardnewslist";
		}
		 
		//adminboardnoticelist에 입력(파일포함)
		@PostMapping("/admin/boardnoticeinsert")
		public String boardnoticeinsert(@RequestParam("uploadfile")MultipartFile uploadfile,
										BoardNotice dto,
										@CurrentUser Users users) throws Exception{

			boardNoticeService.BoardNoticeInsert(users.getUserIdennum(),dto,uploadfile);
			return "redirect:/boardnoticelist";
		}
	

}
