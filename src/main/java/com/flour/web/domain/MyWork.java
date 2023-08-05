package com.flour.web.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MyWork {
	
	//MYWORK
	private int MYWORKID;
	private String MYWORKTASK;
	private String MYWORKWORK;
	private String MYWORKSTATUS;
	private String MYWORKSTARTTIME;
	private String MYWORKENDTIME;
	private String userIdennum;
	
	//테이블항목아님
	private int myWorkCount; //전체행수
	private int myWorkCompleteCount; //완료된 행의  수
	
	//USER
	//private String USER_ID;
	private String USERNAME;
	private String USERPOSITION;
	//private String DEPARTMENT_ID;
	
	//DEPARTMENT
	private int DEPARTMENTID;
	private String DEPARTMENTNAME;
	
	//MYWORK_PROGRESS
	private int MYWORKPROGRESSVALUE;
}
