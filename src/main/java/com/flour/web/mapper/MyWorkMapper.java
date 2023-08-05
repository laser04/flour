package com.flour.web.mapper;

import java.time.LocalDate;
import java.util.List;

import com.flour.web.domain.MyWork;
import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface MyWorkMapper {

    //첫myWork화면(내업무목록,진행정도(같은팀+내 기준))
    public List<com.flour.web.domain.MyWork> myWork(String userIdennum) throws Exception;

    //team전체 업무정보 목록들
    public List<com.flour.web.domain.MyWork> teamWork(int DEPARTMENTID) throws Exception;

    //부서별 명단
    public List<com.flour.web.domain.MyWork> teamWorkUser(int DEPARTMENTID) throws Exception;

    //일정추가
    public void myWorkInsert(MyWork dto) throws Exception;

    //업무수정
    public void myWorkUpdate(MyWork dto) throws Exception;

    //업무 완료
    public void myWorkComplete(String MYWORKID, String MYWORKENDTIME) throws Exception;

    //업무 삭제
    public void myWorkDelete(String MYWORKID) throws Exception;

    //기간 만료된(즉 오늘날짜가 MYWORKENDTIME보다 클때)행 정보들 삭제
    public void deleteExpiredMyWork(LocalDate today) throws Exception;

    //전체행의 개수
    public com.flour.web.domain.MyWork myWorkCount(String userIdennum) throws Exception;

    //상태가 완료인 행의 개수
    public com.flour.web.domain.MyWork myWorkCompleteCount(String userIdennum) throws Exception;

    //MYWORK_PROGRESS 정보가져오기
    public com.flour.web.domain.MyWork myProgressUser(String userIdennum) throws Exception;

    //MYWORK_PROGRESS에 userid와 진행률 입력(처음인경우)
    public void myProgressInsert(String userIdennum, int MYWORKPROGRESSVALUE) throws Exception;

    //MYWORK_PROGRESS에 userid와 진행률 업데이트(기존인 경우)
    public void myProgressUpdate(String userIdennum, int MYWORKPROGRESSVALUE) throws Exception;


}
