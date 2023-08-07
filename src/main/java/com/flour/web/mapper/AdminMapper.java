package com.flour.web.mapper;

import java.util.List;

import com.flour.web.domain.DocumentPayment;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface AdminMapper {
	
	//로그인된 사용자정보
	public DocumentPayment userInfo(@Param("userIdennum") String userIdennum) throws Exception;
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
	public void holidayCheck(@Param("DOCUMENTHOLIDAYNUM")	String DOCUMENTHOLIDAYNUM) throws Exception;
	//휴가신청서 체크해제(AJAX)
	public void holidayunCheck(@Param("DOCUMENTHOLIDAYNUM")String DOCUMENTHOLIDAYNUM) throws Exception;
	//업무보고서 체크(AJAX)
	public void taskreportCheck(@Param("DOCUMENTTASKREPORTNUM")String DOCUMENTTASKREPORTNUM) throws Exception;
	//업무보고서 체크해제(AJAX)
	public void taskreportUnCheck(@Param("DOCUMENTTASKREPORTNUM")String DOCUMENTTASKREPORTNUM) throws Exception;
	//사직서 체크(AJAX)
	public void resignationCheck(@Param("DOCUMENTRESIGNATIONNUM") String DOCUMENTRESIGNATIONNUM) throws Exception;
	//사직서 체크해제(AJAX)
	public void resignationUnCheck(@Param("DOCUMENTRESIGNATIONNUM") String DOCUMENTRESIGNATIONNUM) throws Exception;
	
	
	//결제버튼 클릭(결제처리) 휴가,업무,사직
	public void holiday_PaymentComplete(@Param("paymentuserid")	String paymentuserid,
			@Param("paymentName")String paymentName,
			@Param("paymentDepartment")String paymentDepartment) throws Exception;
	public void taskreport_PaymentComplete(@Param("paymentuserid")String paymentuserid,
			@Param("paymentName")String paymentName,
			@Param("paymentDepartment")String paymentDepartment) throws Exception;
	public void resignation_PaymentComplete(@Param("paymentuserid")String paymentuserid,
			@Param("paymentName")String paymentName,
			@Param("paymentDepartment")String paymentDepartment) throws Exception;
	
	//반려버튼 클릭(반려처리)  휴가,업무,사직
	public void holiday_PaymentReject(@Param("paymentuserid")String paymentuserid,
			@Param("paymentName")String paymentName,
			@Param("paymentDepartment")String paymentDepartment) throws Exception;
	public void taskreport_PaymentReject(@Param("paymentuserid")String paymentuserid,
			@Param("paymentName")String paymentName,
			@Param("paymentDepartment")String paymentDepartment) throws Exception;
	public void resignation_PaymentReject(@Param("paymentuserid")String paymentuserid,
			@Param("paymentName")String paymentName,
			@Param("paymentDepartment")String paymentDepartment) throws Exception;
	
	//결재완료or반려 삭제
	public void paymentHolidayDelete() throws Exception;
	public void paymentTaskreportDelete() throws Exception;
	public void paymentResignDelete() throws Exception;
	
	
}
