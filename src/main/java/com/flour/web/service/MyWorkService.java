package com.flour.web.service;



import java.util.List;

import com.flour.web.domain.MyWork;

public interface MyWorkService {

	
	////유저정보
	public List<MyWork> myWork(String USERID) throws Exception;
	//팀 전체 업무정보 목록들
	public List<MyWork> teamWorkList(String DEPARTMENTNAME) throws Exception;
	//부서별 명단+진행률정보
	public List<MyWork> teamWorkUserList(String DEPARTMENTNAME) throws Exception;
	//Progress
	public MyWork myworkProgress(String USERID)  throws Exception;
	//일정추가
	public void myWorkInsert(MyWork dto,String USERID) throws Exception;
	//업무 수정
	public void myWorkUpdate(MyWork dto) throws Exception;
	//업무 완료
	public void myWorkComplete(String MYWORKID,String MYWORKENDTIME) throws Exception;
	//업무 삭제
	public void myWorkDelete(String MYWORKID) throws Exception;
	
	//기간 만료된(즉 오늘날짜가 MYWORKENDTIME보다 클때)행 정보들 삭제
	public void deleteExpiredMyWork() throws Exception;
	
	//자신의 전체 행개수
	public int CalculateProgress(String USERID) throws Exception;
	
	
}
