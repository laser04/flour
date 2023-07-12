package com.flour.FlourProject.board.dto;




import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardDTO {

	 
	//BOARD
	private int		BOARDID;
	private String	BOARDTITLE;
	private String	BOARDCONTENT;	
	private Date	BOARDREGDATE;
	private String	BOARDCOUNT;
	private String	BOARDFILEPATH;
	private String	BOARDFAVORITE;
	private String	USERID;
	
	//USER
	private String	USERNAME;
	private String	USERADMIN;
	
	//게시판 검색
	private String searchCondition;
	private String searchKeyword;
	//게시판 페이징
	private int boardPagecount; //게시판행개수 
	
	//uploadFile  (import org.springframework.web.multipart.MultipartFile;)
	private MultipartFile uploadFile;
	
}
