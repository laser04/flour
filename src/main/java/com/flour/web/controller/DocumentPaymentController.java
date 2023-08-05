package com.flour.web.controller;

import java.util.ArrayList;


import com.flour.web.annotation.CurrentUser;
import com.flour.web.domain.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.flour.web.domain.DocumentPayment;
import com.flour.web.service.DocumentPaymentService;

@Controller
public class DocumentPaymentController {
	
	@Autowired
	DocumentPaymentService documentpaymentservice;
	
	//결제 첫화면
	@GetMapping("/approval")
	public ModelAndView  documentPayment(@CurrentUser Users users) throws Exception {

		DocumentPayment userInfodto=
				documentpaymentservice.userInfo(users.getUserIdennum());

		//휴가신청서 모든 정보들
		ArrayList<DocumentPayment> holidayList
				=(ArrayList<DocumentPayment>)documentpaymentservice.holidayList();
		//업무보고서 모든 정보들
		ArrayList<DocumentPayment> taskreportList
				=(ArrayList<DocumentPayment>)documentpaymentservice.taskreportList();		
		//사직서 모든 정보들
		ArrayList<DocumentPayment> resignationList
				=(ArrayList<DocumentPayment>)documentpaymentservice.resignationList();

		//3 테이블 전부 check항목  null로 업데이트 시키기
		documentpaymentservice.AllCheckNull();
		
		
		ModelAndView mav=new ModelAndView("/document/documentPayment");
		mav.addObject("holidayList",holidayList);
		mav.addObject("taskreportList",taskreportList);
		mav.addObject("resignationList",resignationList);
		mav.addObject("userInfo",userInfodto);	
		return mav;
	}
	
	//휴가신청서 insert
	@PostMapping("/approval/holidayinsert")
	public String holidayInsert(DocumentPayment dto) throws Exception {
		
		documentpaymentservice.holidayInsert(dto);
		return "redirect:/approval";
	}
	
	//업무보고서 insert
	@PostMapping("/approval/taskreportinsert")
	public String taskReportInsert(DocumentPayment dto) throws Exception{
		
		documentpaymentservice.taskreportinsert(dto);
		return "redirect:/approval";
	}
	
	//사직서 insert
	@PostMapping("/approval/resignationinsert")
	public String resignationInsert(DocumentPayment dto) throws Exception{
		
		documentpaymentservice.resignationInsert(dto);
		return "redirect:/approval";
	}
	
	
	//체크/언체크
	//휴가신청서 체크(AJAX)
	@PutMapping("/approval/holidaycheck")
	public ResponseEntity<String> holidayCheck(
			@RequestParam("DOCUMENTHOLIDAYNUM")String DOCUMENTHOLIDAYNUM ) throws Exception{
		
		documentpaymentservice.holidayCheck(DOCUMENTHOLIDAYNUM);
		return new ResponseEntity<>("holidayCheck!", HttpStatus.OK);
	}
	//휴가신청서 체크해제(AJAX)
	@PutMapping("/approval/holidayuncheck")
	public ResponseEntity<String> holidayUnCheck(
			@RequestParam("DOCUMENTHOLIDAYNUM")String DOCUMENTHOLIDAYNUM ) throws Exception{
		
		documentpaymentservice.holidayunCheck(DOCUMENTHOLIDAYNUM);
		return new ResponseEntity<>("holidayUnCheck!", HttpStatus.OK);
	}
	//업무보고서 체크(AJAX)
	@PutMapping("/approval/taskreportcheck")
	public ResponseEntity<String> taskreportCheck(
			@RequestParam("DOCUMENTTASKREPORTNUM")String DOCUMENTTASKREPORTNUM ) throws Exception{
		
		documentpaymentservice.taskreportCheck(DOCUMENTTASKREPORTNUM);
		return new ResponseEntity<>("taskreportCheck!", HttpStatus.OK);
	}
	//업무보고서 체크해제(AJAX)
	@PutMapping("/approval/taskreportuncheck")
	public ResponseEntity<String> taskreportUnCheck(
			@RequestParam("DOCUMENTTASKREPORTNUM")String DOCUMENTTASKREPORTNUM ) throws Exception{
		
		documentpaymentservice.taskreportUnCheck(DOCUMENTTASKREPORTNUM);
		return new ResponseEntity<>("taskreportUnCheck!", HttpStatus.OK);
	}
	//사직서 체크(AJAX)   
	@PutMapping("/approval/resignationcheck")
	public ResponseEntity<String> resignationCheck(
			@RequestParam("DOCUMENTRESIGNATIONNUM")String DOCUMENTRESIGNATIONNUM ) throws Exception{
		
		documentpaymentservice.resignationCheck(DOCUMENTRESIGNATIONNUM);
		return new ResponseEntity<>("resignationCheck!", HttpStatus.OK);
	}
	//사직서 체크해제(AJAX)
	@PutMapping("/approval/resignationuncheck")
	public ResponseEntity<String> resignationUnCheck(
			@RequestParam("DOCUMENTRESIGNATIONNUM")String DOCUMENTRESIGNATIONNUM ) throws Exception{
		
		documentpaymentservice.resignationUnCheck(DOCUMENTRESIGNATIONNUM);
		return new ResponseEntity<>("resignationUnCheck!", HttpStatus.OK);
	}
	
	
	//결재대기or반려 삭제
	@GetMapping("/approval/approvaldelete")
	public String paymentDelete() throws Exception {
		
		documentpaymentservice.paymentDelete();
		return "redirect:/approval";
	}
	

}
