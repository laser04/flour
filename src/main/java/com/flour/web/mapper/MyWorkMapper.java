package com.flour.web.mapper;

import java.time.LocalDate;
import java.util.List;

import com.flour.web.domain.MyWork;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;


@Mapper
public interface MyWorkMapper {

    //첫myWork화면(내업무목록,진행정도(같은팀+내 기준))
    public List<MyWork> myWork(@Param("userIdennum") String userIdennum) throws Exception;

    //team전체 업무정보 목록들
    public List<MyWork> teamWork(@Param("DEPARTMENTNAME")String DEPARTMENTNAME) throws Exception;

    //부서별 명단
    public List<MyWork> teamWorkUser(@Param("DEPARTMENTNAME")String DEPARTMENTNAME) throws Exception;

    //일정추가
    public void myWorkInsert(MyWork dto) throws Exception;

    //업무수정
    public void myWorkUpdate(MyWork dto) throws Exception;

    //업무 완료
    public void myWorkComplete(@Param("MYWORKID")String MYWORKID, 
    		@Param("MYWORKENDTIME")String MYWORKENDTIME) throws Exception;

    //업무 삭제
    public void myWorkDelete(@Param("MYWORKID") String MYWORKID) throws Exception;

    //기간 만료된(즉 오늘날짜가 MYWORKENDTIME보다 클때)행 정보들 삭제
    public void deleteExpiredMyWork(@Param("today")LocalDate today) throws Exception;

    //전체행의 개수
    public MyWork myWorkCount(@Param("userIdennum")String userIdennum) throws Exception;

    //상태가 완료인 행의 개수
    public MyWork myWorkCompleteCount(@Param("userIdennum")String userIdennum) throws Exception;

    //MYWORK_PROGRESS 정보가져오기
    public MyWork myProgressUser(@Param("userIdennum")String userIdennum) throws Exception;

    //MYWORK_PROGRESS에 userid와 진행률 입력(처음인경우)
    public void myProgressInsert(@Param("userIdennum")String userIdennum,@Param("MYWORKPROGRESSVALUE") int MYWORKPROGRESSVALUE) throws Exception;

    //MYWORK_PROGRESS에 userid와 진행률 업데이트(기존인 경우)
    public void myProgressUpdate(@Param("userIdennum")String userIdennum,@Param("MYWORKPROGRESSVALUE") int MYWORKPROGRESSVALUE) throws Exception;


}
