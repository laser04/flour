package com.flour.web.service;

import java.util.ArrayList;
import java.util.List;

import com.flour.web.domain.DocumentPayment;
import com.flour.web.mapper.AdminMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	AdminMapper adminmapper;
	
	//로그인된 사용자정보
	@Override
	public DocumentPayment userInfo(String USERID) throws Exception {
		
		DocumentPayment userdto=adminmapper.userInfo(USERID);
		return userdto;
	}
	
	//휴가신청서 모든 정보들
	@Override
	public List<DocumentPayment> holidayList() throws Exception {
		ArrayList<DocumentPayment> holidayList
				=(ArrayList<DocumentPayment>)adminmapper.holidayList();
		return holidayList;
	}
	
	//업무보고서 모든 정보들
	@Override
	public List<DocumentPayment> taskreportList() throws Exception {
		ArrayList<DocumentPayment> taskreportList
				=(ArrayList<DocumentPayment>)adminmapper.taskreportList();
		return taskreportList;
	}
	
	//사직서 모든 정보들
	@Override
	public List<DocumentPayment> resignationList() throws Exception {
		ArrayList<DocumentPayment> resignationList
				=(ArrayList<DocumentPayment>)adminmapper.resignationList();
		return resignationList;
	}
	
	//3 테이블 전부 check항목  null로 업데이트 시키기
	@Override
	public void AllCheckNull() throws Exception {
		adminmapper.holidayAllCheckNull();
		adminmapper.taskreportAllCheckNull();
		adminmapper.resignAllCheckNull();
	}
	
	
	
	//휴가신청서 체크(AJAX)
	@Override
	public void holidayCheck(String DOCUMENTHOLIDAYNUM) throws Exception {
		
		adminmapper.holidayCheck(DOCUMENTHOLIDAYNUM);
	}
	//휴가신청서 체크해제(AJAX)
	@Override
	public void holidayunCheck(String DOCUMENTHOLIDAYNUM) throws Exception {
		adminmapper.holidayunCheck(DOCUMENTHOLIDAYNUM);
	}
	//업무보고서 체크(AJAX)
	@Override
	public void taskreportCheck(String DOCUMENTTASKREPORTNUM) throws Exception {
		adminmapper.taskreportCheck(DOCUMENTTASKREPORTNUM);
	}
	//업무보고서 체크해제(AJAX)
	@Override
	public void taskreportUnCheck(String DOCUMENTTASKREPORTNUM) throws Exception {
		adminmapper.taskreportUnCheck(DOCUMENTTASKREPORTNUM);
	}
	//사직서 체크(AJAX)
	@Override
	public void resignationCheck(String DOCUMENTRESIGNATIONNUM) throws Exception {
		adminmapper.resignationCheck(DOCUMENTRESIGNATIONNUM);
	}
	//사직서 체크해제(AJAX)
	@Override
	public void resignationUnCheck(String DOCUMENTRESIGNATIONNUM) throws Exception {
		adminmapper.resignationUnCheck(DOCUMENTRESIGNATIONNUM);
	}

	
	//결제버튼 클릭(결제처리)
	@Override
	public void paymentComplete(String paymentuserid,String paymentName
			,String paymentDepartment) throws Exception {
		adminmapper.holiday_PaymentComplete(paymentuserid,paymentName,paymentDepartment); //상태가 결재완료로 업데이트
		adminmapper.taskreport_PaymentComplete(paymentuserid,paymentName,paymentDepartment);
		adminmapper.resignation_PaymentComplete(paymentuserid,paymentName,paymentDepartment);
		
	}
	//반려버튼 클릭(반려처리)
	@Override
	public void paymentReject(String paymentuserid,String paymentName
			,String paymentDepartment) throws Exception {
		adminmapper.holiday_PaymentReject(paymentuserid,paymentName,paymentDepartment);
		adminmapper.taskreport_PaymentReject(paymentuserid,paymentName,paymentDepartment);
		adminmapper.resignation_PaymentReject(paymentuserid,paymentName,paymentDepartment);
	}

	//결재완료or반려 삭제
	@Override
	public void paymentDelete() throws Exception {
		adminmapper.paymentHolidayDelete();
		adminmapper.paymentTaskreportDelete();
		adminmapper.paymentResignDelete();
	}

	

	
	
	
	
	
}
