package com.flour.web.service;

import java.util.List;

import com.flour.web.domain.DocumentPayment;

public interface DocumentPaymentService {

	
	//결제 첫화면 유저 이름,입사일  부서 아이디 ,부서이름 정보가져오기  
	public DocumentPayment userInfo(String USERID) throws Exception; 
	//휴가신청서 모든 정보들
	public List<DocumentPayment> holidayList() throws Exception;
	//업무보고서 모든 정보들
	public List<DocumentPayment> taskreportList() throws Exception;
	//사직서 모든 정보들
	public List<DocumentPayment> resignationList() throws Exception;
	
	//3 테이블 전부 check항목  null로 업데이트 시키기
	public void AllCheckNull() throws Exception;
	
	//휴가신청서 insert
	public void holidayInsert(DocumentPayment dto) throws Exception; 
	//업무보고서 insert
	public void taskreportinsert(DocumentPayment dto) throws Exception; 
	//사직서 insert
	public void resignationInsert(DocumentPayment dto) throws Exception; 
	
	//체크 언체크
	//휴가신청서 체크(AJAX)
	public void holidayCheck(String DOCUMENTHOLIDAYNUM) throws Exception;
	//휴가신청서 체크해제(AJAX)
	public void holidayunCheck(String DOCUMENTHOLIDAYNUM) throws Exception;
	//업무보고서 체크(AJAX)
	public void taskreportCheck(String DOCUMENTTASKREPORTNUM) throws Exception;
	//업무보고서 체크해제(AJAX)
	public void taskreportUnCheck(String DOCUMENTTASKREPORTNUM) throws Exception;
	//사직서 체크(AJAX)
	public void resignationCheck(String DOCUMENTRESIGNATIONNUM) throws Exception;
	//사직서 체크해제(AJAX)
	public void resignationUnCheck(String DOCUMENTRESIGNATIONNUM) throws Exception;
	
	//결재or반려 삭제
	public void paymentDelete () throws Exception;
	
}
 