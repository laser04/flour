package com.flour.web.service;

import java.time.LocalDate;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.flour.web.domain.MyWork;
import com.flour.web.mapper.MyWorkMapper;


@Service
public class MyWorkServiceImpl implements MyWorkService{

	@Autowired
	private MyWorkMapper myworkmapper;
	//유저정보
	@Override
	public List<MyWork> myWork(String USERID) throws Exception {

        return myworkmapper.myWork(USERID);
	}
	
	//팀 전체 업무정보 목록들
	@Override
	public List<MyWork> teamWorkList(int DEPARTMENTID) throws Exception {

		//팀 전체 업무정보 목록들
        return myworkmapper.teamWork(DEPARTMENTID);
	}
	//부서별 명단+진행률정보
	@Override
	public List<MyWork> teamWorkUserList(int DEPARTMENTID) throws Exception {
		//부서별 명단+진행률정보

        return myworkmapper.teamWorkUser(DEPARTMENTID);
	}
	//progress
	@Override
	public MyWork myworkProgress(String USERID) throws Exception {
		
		//Progress테이블에  넣는과정
		int MYWORKPROGRESSVALUE=CalculateProgress(USERID);//진행률 수치게산
		MyWork myworkprogressdto=myworkmapper.myProgressUser(USERID);
		
		//** 이런 구조때문에 업무내역을 하나라도 저장 해야지 팀 업무목록에 나옴  
		if(myworkprogressdto==null ) {
		//USERID가 조건인 MYWORK_PROGRESS테이블에  정보가없을때(즉 progress테이블정보없을때 insert )
		myworkmapper.myProgressInsert(USERID, MYWORKPROGRESSVALUE);
		}
		else { //null이 아닐 없을경우
		//MYWORK_PROGRESS테이블에 정보있을때 update
		myworkmapper.myProgressUpdate(USERID, MYWORKPROGRESSVALUE);
		}
	
		myworkprogressdto=myworkmapper.myProgressUser(USERID);//바뀐 해당유저 MYWORK_PROGRESS의 DTO
	
		deleteExpiredMyWork();//*만기된 행은 (즉, 오늘날짜>endtime 인행은 삭제)
		return myworkprogressdto;
	}
	
	//일정추가
	@Override
	public void myWorkInsert(MyWork dto,String USERID) throws Exception {
		

		dto.setUserIdennum(USERID);//dto에 로그인된 내 id정보를 주입
		myworkmapper.myWorkInsert(dto);	
	}
	//업무수정
	@Override
	public void myWorkUpdate(MyWork dto) throws Exception {
		myworkmapper.myWorkUpdate(dto);
	}
	//업무완료
	@Override
	public void myWorkComplete(String MYWORKID,String MYWORKENDTIME) throws Exception {
		myworkmapper.myWorkComplete(MYWORKID,MYWORKENDTIME);
	}
	
	//업무 삭제
	@Override
	public void myWorkDelete(String MYWORKID) throws Exception {
		myworkmapper.myWorkDelete(MYWORKID);
	}
	
	//기능: 기간 만료된(즉 오늘날짜가 MYWORKENDTIME보다 클때)행 정보들 삭제 기능 메서드
	@Transactional
	@Override
	public void deleteExpiredMyWork() throws Exception {
		try {
	        LocalDate today = LocalDate.now();
	        myworkmapper.deleteExpiredMyWork(today);
	    } catch (Exception e) {
	    	System.out.println("만기된 업무삭제중 오류발생->롤백처리됐습니다");
	    }
		
	}
	
	//기능: progress 계산 메서드 
	@Override
	public int CalculateProgress(String USERID ) throws Exception {
		
		MyWork myWorkCountdto=myworkmapper.myWorkCount(USERID);
		MyWork myWorkCountCompletedto
				=myworkmapper.myWorkCompleteCount(USERID);
		
		int myWorkCount=myWorkCountdto.getMyWorkCount();		//전체행의개수
		int	myWorkCountComplete
		=myWorkCountCompletedto.getMyWorkCompleteCount();	//상태가 완료인 행의 개수
		int  MYWORKPROGRESSVALUE
			=Math.round(((float)myWorkCountComplete/myWorkCount)*100);//진행률계산
		return MYWORKPROGRESSVALUE;
	}


	
	
	
	
	
	
}
