package com.flour.FlourProject.Paging;

import java.util.HashMap;

import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

@Component
public class Paging {
	//페이징
		public HashMap<String,Integer> paging(String pageNum,Model model,int boardpagecount) throws Exception{
			
			//페이지별 테이블 보여줄수있게 구현
			
			//****중요
			int pageSize=10; //한페이지에 출력된 행수
			
			if(pageNum==null) {//현제페이지 정보 설정
				pageNum="1";
			}
			
			int currentPage=Integer.parseInt(pageNum);//첫행번호를 계산
			int startRow=(currentPage-1)*pageSize+1;
			//페이지 번호들 출력
			 
			int bcnt=boardpagecount;
			int pageCount=bcnt/pageSize + (bcnt%pageSize== 0? 0:1); //총페이지수
			//****중요
			int pageblock=5; //한페이지에 보여줄 페이지블럭
			int startPage=((currentPage-1)/pageblock)*pageblock+1;//한페이지에 보여줄 페이지 블럭시작번호
			int endPage=startPage+pageblock-1;	//한페이지에 보여줄 페이지 블럭끝번호
			if(endPage>pageCount)
				{
					endPage=pageCount;
				}
		
			
			HashMap<String, Integer> pageInfo=new HashMap<String, Integer>();
			model.addAttribute("startPage",startPage);
			model.addAttribute("endPage",endPage);
			model.addAttribute("pageblock",pageblock);
			model.addAttribute("pageCount",pageCount);
			HashMap<String,Integer> pageinfo=new HashMap<String, Integer>();
			pageinfo.put("startRow", startRow);
			pageinfo.put("pageSize", pageSize);
			return pageinfo;
			
		}

}
