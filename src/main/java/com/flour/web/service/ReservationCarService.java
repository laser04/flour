package com.flour.web.service;

import java.util.List;

import com.flour.web.domain.ReservationCar;

public interface ReservationCarService {
	
	//예약-회의실 이동
	public List<ReservationCar>	carCategoryList()  throws Exception;
	//차량 신청
	public void reservationRequest(ReservationCar dto) throws Exception;
	//관리자->차량 요청 승인
	public void requestAccept(String RESERVATIONCARID
			,String RESERVATIONCARSTATUS) throws Exception;
	
	//차량사용완료(승인완료-->신청으로 바뀌게)
	public void useComplete(String RESERVATIONCARID
			,String RESERVATIONCARSTATUS) throws Exception;
	
	//차량 반려
	public void carReject (ReservationCar dto) throws Exception;
	
	
}
