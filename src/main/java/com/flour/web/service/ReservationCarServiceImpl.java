package com.flour.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.flour.web.domain.ReservationCar;
import com.flour.web.mapper.ReservationCarMapper;

@Service
public class ReservationCarServiceImpl implements ReservationCarService{
	
	@Autowired
	ReservationCarMapper reservationcarMapper;
	
	//예약-회의실 이동
	@Override
	public List<ReservationCar> carCategoryList() throws Exception {
        return reservationcarMapper.carCategoryList();
	}
	
	//차량 신청
	@Override
	public void reservationRequest(ReservationCar dto) throws Exception {
		reservationcarMapper.reservationRequest(dto);
	}
	
	//관리자->차량 요청 승인
	@Override
	public void requestAccept(String RESERVATIONCARID, String RESERVATIONCARSTATUS) throws Exception {
		reservationcarMapper.requestAccept(RESERVATIONCARID, RESERVATIONCARSTATUS);
	}
	
	//차량사용완료(승인완료-->신청으로 바뀌게)
	@Override
	public void useComplete(String RESERVATIONCARID, String RESERVATIONCARSTATUS) throws Exception {
		reservationcarMapper.useComplete(RESERVATIONCARID, RESERVATIONCARSTATUS);
	}
	
	//차량 반려
	@Override
	public void carReject(ReservationCar dto) throws Exception {
		reservationcarMapper.carReject(dto);
	}

	
}
