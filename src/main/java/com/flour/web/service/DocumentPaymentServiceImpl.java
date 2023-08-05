package com.flour.web.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.flour.web.domain.DocumentPayment;
import com.flour.web.mapper.DocumentPaymentMapper;

@Service
public class DocumentPaymentServiceImpl implements DocumentPaymentService {
	
	@Autowired
	DocumentPaymentMapper documentpaymentmapper;
	
	//결제 첫화면 유저 이름,입사일  부서 아이디 ,부서이름 정보가져오기  
	@Override
	public DocumentPayment userInfo(String USERID) throws Exception {
		
		DocumentPayment Userinfodto= documentpaymentmapper.userInfo(USERID);
		
		  //입사년월일 데이터형식 조작
		  String dateTimeString = Userinfodto.getUSERCREATEDDATE();
	      DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	      LocalDate date = LocalDate.parse(dateTimeString, formatter);
	      DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	      String formattedDate = date.format(outputFormatter);
	      Userinfodto.setUSERCREATEDDATE(formattedDate);		//다시  Userinfodto에 변형한거 set
	       
		return Userinfodto;
	}
	
	
	//휴가신청서 모든 정보들
	@Override
	public List<DocumentPayment> holidayList() throws Exception {
		ArrayList<DocumentPayment> holidayList
				=(ArrayList<DocumentPayment>)documentpaymentmapper.holidayList();
		return holidayList;
	}
	
	//업무보고서 모든 정보들
	@Override
	public List<DocumentPayment> taskreportList() throws Exception {
		ArrayList<DocumentPayment> taskreportList
				=(ArrayList<DocumentPayment>)documentpaymentmapper.taskreportList();
		return taskreportList;
	}
	
	//사직서 모든 정보들
	@Override
	public List<DocumentPayment> resignationList() throws Exception {
		ArrayList<DocumentPayment> resignationList
				=(ArrayList<DocumentPayment>)documentpaymentmapper.resignationList();
		return resignationList;
	}
	
	//3 테이블 전부 check항목  null로 업데이트 시키기
	@Override
	public void AllCheckNull() throws Exception {
		documentpaymentmapper.holidayAllCheckNull();
		documentpaymentmapper.taskreportAllCheckNull();
		documentpaymentmapper.resignAllCheckNull();
	}
	
	
	//휴가신청서 insert
	@Override
	public void holidayInsert(DocumentPayment dto) throws Exception {
		documentpaymentmapper.holidayInsert(dto);	
	}
	
	//업무보고서 insert
	@Override
	public void taskreportinsert(DocumentPayment dto) throws Exception {
		
		documentpaymentmapper.taskreportinsert(dto);
	}
	
	//사직서 insert
	@Override
	public void resignationInsert(DocumentPayment dto) throws Exception {
		
		documentpaymentmapper.resignationInsert(dto);
	}
	
	//체크언체크
	//휴가신청서 체크(AJAX)
	@Override
	public void holidayCheck(String DOCUMENTHOLIDAYNUM) throws Exception {
		
		documentpaymentmapper.holidayCheck(DOCUMENTHOLIDAYNUM);
	}
	//휴가신청서 체크해제(AJAX)
	@Override
	public void holidayunCheck(String DOCUMENTHOLIDAYNUM) throws Exception {
		documentpaymentmapper.holidayunCheck(DOCUMENTHOLIDAYNUM);
	}
	//업무보고서 체크(AJAX)
	@Override
	public void taskreportCheck(String DOCUMENTTASKREPORTNUM) throws Exception {
		documentpaymentmapper.taskreportCheck(DOCUMENTTASKREPORTNUM);
	}
	//업무보고서 체크해제(AJAX)
	@Override
	public void taskreportUnCheck(String DOCUMENTTASKREPORTNUM) throws Exception {
		documentpaymentmapper.taskreportUnCheck(DOCUMENTTASKREPORTNUM);
	}
	//사직서 체크(AJAX)
	@Override
	public void resignationCheck(String DOCUMENTRESIGNATIONNUM) throws Exception {
		documentpaymentmapper.resignationCheck(DOCUMENTRESIGNATIONNUM);
	}
	//사직서 체크해제(AJAX)
	@Override
	public void resignationUnCheck(String DOCUMENTRESIGNATIONNUM) throws Exception {
		documentpaymentmapper.resignationUnCheck(DOCUMENTRESIGNATIONNUM);
	}

	
	//결재대기or반려 삭제
	@Override
	public void paymentDelete() throws Exception {
		documentpaymentmapper.paymentHolidayDelete();
		documentpaymentmapper.paymentTaskreportDelete();
		documentpaymentmapper.paymentResignDelete();
	}


	
	
	
	
	
	
	
	
	
	
}
