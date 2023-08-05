package com.flour.web.domain;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Board {

	 
	//BOARD
	private int	boardId;
	private String	boardTitle;
	private String	boardContent;	//insertboard용
	private String	boardRegDate;
	private String	boardCount; 	//insertboard용
	private String	boardFileName;
	private String	boardFilePath;
	private String	userIdennum;
	
	
	
	
	//USER
	private String	userName;
	private String	userRole;
	
	//게시판 검색
	private String searchCondition;
	private String searchKeyword;

	//게시판 페이징
	private int boardPageCount; //게시판행개수
	
	//DEPARTMENT
	private int departmentId;	
	private String departmentName;	 //moveinsert용
	
	//uploadFile
	private String contextPath;
	private String uuid;
	private String fileName;
	private String contentType;
	
	//댓글 
	private int boardCommentId;
	private String boardCommentUserIdennum;
	private String boardCommentContent;
	private String boardCommentRegdate;
	
	
	//파일 다운로드용 생성자
	public Board() {}
	public Board(String contextPath, String uuid, String fileName, String contentType) {
		this.contextPath=contextPath;
		this.uuid=uuid;
		this.fileName=fileName;
		this.contentType=contentType;
	}
	
	
}
