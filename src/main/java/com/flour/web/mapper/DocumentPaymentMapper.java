package com.flour.web.mapper;

import java.util.List;

import com.flour.web.domain.DocumentPayment;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface DocumentPaymentMapper {
	
	//결제 첫화면 유저 이름,입사일  부서 아이디 ,부서이름 정보가져오기  
	public DocumentPayment userInfo(@Param("userIdennum")String userIdennum) throws Exception;
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
	
	
	//휴가신청서 insert
	public void holidayInsert(DocumentPayment dto) throws Exception;
	//업무보고서 insert
	public void taskreportinsert(DocumentPayment dto) throws Exception;
	//사직서 insert
	public void resignationInsert(DocumentPayment dto) throws Exception;
	
	//체크/언체크
	//휴가신청서 체크(AJAX)
	public void holidayCheck(@Param("DOCUMENTHOLIDAYNUM")String DOCUMENTHOLIDAYNUM) throws Exception;
	//휴가신청서 체크해제(AJAX)
	public void holidayunCheck(@Param("DOCUMENTHOLIDAYNUM") String DOCUMENTHOLIDAYNUM) throws Exception;
	//업무보고서 체크(AJAX)
	public void taskreportCheck(@Param("DOCUMENTTASKREPORTNUM")String DOCUMENTTASKREPORTNUM) throws Exception;
	//업무보고서 체크해제(AJAX)
	public void taskreportUnCheck(@Param("DOCUMENTTASKREPORTNUM")String DOCUMENTTASKREPORTNUM) throws Exception;
	//사직서 체크(AJAX)
	public void resignationCheck(@Param("DOCUMENTRESIGNATIONNUM")String DOCUMENTRESIGNATIONNUM) throws Exception;
	//사직서 체크해제(AJAX)
	public void resignationUnCheck(@Param("DOCUMENTRESIGNATIONNUM")String DOCUMENTRESIGNATIONNUM) throws Exception;
	
	//결재대기or반려 삭제
	public void paymentHolidayDelete() throws Exception;
	public void paymentTaskreportDelete() throws Exception;
	public void paymentResignDelete() throws Exception;
	
	
}
