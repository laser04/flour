package com.flour.web.service;

import java.util.List;

import com.flour.web.domain.DocumentPayment;
import com.flour.web.domain.DocumentPayment;

public interface AdminService {
	
	//로그인된 사용자정보
	public DocumentPayment userInfo(String USERID) throws Exception;
	//휴가신청서 모든 정보들
	public List<DocumentPayment> holidayList() throws Exception;
	//업무보고서 모든 정보들
	public List<DocumentPayment> taskreportList() throws Exception;
	//사직서 모든 정보들
	public List<DocumentPayment> resignationList() throws Exception;
	
	//3 테이블 전부 check항목  null로 업데이트 시키기
	public void AllCheckNull() throws Exception;

	
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
	
	
	//결제버튼 클릭(결제처리)
	public void paymentComplete(String paymentuserid,String paymentName
			,String paymentDepartment) throws Exception;
	//반려버튼 클릭(반려처리)
	public void paymentReject(String paymentuserid,String paymentName
			,String paymentDepartment) throws Exception;
	//결재완료or반려 삭제
	public void paymentDelete () throws Exception;
	
}
