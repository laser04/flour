package com.flour.web.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardNotice {
 
	//BOARD
	private int	BOARDNOTICEID;
	private String	BOARDNOTICETITLE;
	private String	BOARDNOTICECONTENT;	//insertboard용
	private String	BOARDNOTICEREGDATE;
	private String	BOARDNOTICECOUNT; 	//insertboard용
	private String	BOARDNOTICEFILENAME;
	private String	BOARDNOTICEFILEPATH;
	private String	userIdennum;
	
	//USER
	private String	USERNAME;
	private String	USERROLE;
	
	//게시판 검색
	private String searchCondition;
	private String searchKeyword;

	//게시판 페이징
	private int boardNoticePagecount; //게시판행개수 
	
	//DEPARTMENT
	private int DEPARTMENT_ID;	
	private String DEPARTMENTNAME;	 //moveinsert용
	
	//uploadFile
	private String contextPath;
	private String uuid;
	private String fileName;
	private String contentType;
	
	//댓글 
	private int BOARDNOTICECOMMENTID;
	private String BOARDNOTICECOMMENTUSERID;
	private String BOARDNOTICECOMMENTCONTENT;
	private String BOARDNOTICECOMMENTREGDATE;
	
	//파일 다운로드용 생성자
	public BoardNotice() {}
	public BoardNotice(String contextPath, String uuid, String fileName, String contentType) {
		this.contextPath=contextPath;
		this.uuid=uuid;
		this.fileName=fileName;
		this.contentType=contentType;
	}
}
