package com.flour.web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.flour.web.annotation.CurrentUser;
import com.flour.web.domain.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.flour.web.domain.MyWork;
import com.flour.web.service.MyWorkService;

@Controller
public class MyWorkController {
	
	@Autowired 
	private MyWorkService myworkservice;
	@Autowired
	private HttpSession session;
	
	//mywork 첫 전체화면
	@GetMapping("/mywork")
	public ModelAndView  myWork(@CurrentUser Users users) throws Exception{

		session.setAttribute("department_id", 3);

		int DEPARTMENTID=(int)session.getAttribute("department_id");

		myworkservice.myWork(users.getUserIdennum());

		ModelAndView mav=new ModelAndView("/common/myWork");
		
		//내 업무정보 목록들 
		List<MyWork> myWorkList= myworkservice.myWork(users.getUserIdennum());
		//팀 전체 업무정보 목록들
		List<MyWork> teamWorkList= myworkservice.teamWorkList(DEPARTMENTID);
		//부서별 명단+진행률정보
		List<MyWork> teamWorkUserList= myworkservice.teamWorkUserList(DEPARTMENTID);

		mav.addObject("myWorkList",myWorkList);
		mav.addObject("teamWorkList",teamWorkList);
		mav.addObject("teamWorkUserList",teamWorkUserList);

		//Progress
		MyWork myworkprogressdto = myworkservice.myworkProgress(users.getUserIdennum());
		mav.addObject("myworkprogress",myworkprogressdto);//진행률 넣음
		
		return mav;
	} 
	
	//일정 추가
	@PostMapping("/myworkinsert")
	public String myWorkInsert(MyWork dto, @CurrentUser Users users) throws Exception{

		myworkservice.myWorkInsert(dto,users.getUserIdennum());
		return "redirect:/mywork";
	}
	
	//업무 수정
	@PostMapping("/myworkupdate")
	public String myWorkUpdate(MyWork dto) throws Exception{
		myworkservice.myWorkUpdate(dto);
		return "redirect:mywork";
	}
	
	//업무 완료   
	@GetMapping("/myworkcomplete")
	public String myWorkComplete(@RequestParam("MYWORKID")String MYWORKID
			,@RequestParam("MYWORKENDTIME")String MYWORKENDTIME) throws Exception{
		myworkservice.myWorkComplete(MYWORKID,MYWORKENDTIME);
		return "redirect:mywork";
	}
	
	//업무 삭제
	@GetMapping("/myworkdelete")
	public String myWorkDelete(@RequestParam("MYWORKID")String MYWORKID) throws Exception{
		myworkservice.myWorkDelete(MYWORKID);
		return "redirect:mywork";
	}
	
	
}