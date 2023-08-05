package com.flour.web.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardNews {
 
	//BOARD
	private int	BOARDNEWSID;
	private String	BOARDNEWSTITLE;
	private String	BOARDNEWSCONTENT;	//insertboard용
	private String	BOARDNEWSREGDATE;
	private String	BOARDNEWSCOUNT; 	//insertboard용
	private String	BOARDNEWSFILENAME;
	private String	BOARDNEWSFILEPATH;
	private String	userIdennum;
	
	//USER
	private String	USERNAME;
	private String	USERROLE;
	
	//게시판 검색
	private String searchCondition;
	private String searchKeyword;

	//게시판 페이징
	private int boardNewsPagecount; //게시판행개수 
	
	//DEPARTMENT
	private int DEPARTMENT_ID;	
	private String DEPARTMENTNAME;	 //moveinsert용
	
	//uploadFile
	private String contextPath;
	private String uuid;
	private String fileName;
	private String contentType;
	
	//댓글 
	private int BOARDNEWSCOMMENTID;
	private String BOARDNEWSCOMMENTUSERID;
	private String BOARDNEWSCOMMENTCONTENT;
	private String BOARDNEWSCOMMENTREGDATE;
	
	//파일 다운로드용 생성자
	public BoardNews() {}
	public BoardNews(String contextPath, String uuid, String fileName, String contentType) {
		this.contextPath=contextPath;
		this.uuid=uuid;
		this.fileName=fileName;
		this.contentType=contentType;
	}
}
