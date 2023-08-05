package com.flour.web.mapper;

import java.util.List;

import com.flour.web.domain.DocumentPayment;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminMapper {

    //로그인된 사용자정보
    public DocumentPayment userInfo(String userIdennum) throws Exception;

    //휴가신청서 모든 정보들
    public List<DocumentPayment> holidayList() throws Exception;

    //업무보고서 모든 정보들
    public List<DocumentPayment> taskreportList() throws Exception;

    //사직서 모든 정보들
    public List<DocumentPayment> resignationList() throws Exception;

    //휴가테이블 전부 check항목  null로 업데이트 시키기
    public void holidayAllCheckNull() throws Exception;

    //업무보고서테이블 전부 check항목  null로 업데이트 시키기
    public void taskreportAllCheckNull() throws Exception;

    //사직서테이블 전부 check항목  null로 업데이트 시키기
    public void resignAllCheckNull() throws Exception;


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


    //결제버튼 클릭(결제처리) 휴가,업무,사직
    public void holiday_PaymentComplete(String paymentuserid, String paymentName, String paymentDepartment) throws Exception;

    public void taskreport_PaymentComplete(String paymentuserid, String paymentName, String paymentDepartment) throws Exception;

    public void resignation_PaymentComplete(String paymentuserid, String paymentName, String paymentDepartment) throws Exception;

    //반려버튼 클릭(반려처리)  휴가,업무,사직
    public void holiday_PaymentReject(String paymentuserid, String paymentName, String paymentDepartment) throws Exception;

    public void taskreport_PaymentReject(String paymentuserid, String paymentName, String paymentDepartment) throws Exception;

    public void resignation_PaymentReject(String paymentuserid, String paymentName, String paymentDepartment) throws Exception;

    //결재완료or반려 삭제
    public void paymentHolidayDelete() throws Exception;

    public void paymentTaskreportDelete() throws Exception;

    public void paymentResignDelete() throws Exception;


}
