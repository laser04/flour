package com.flour.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.flour.web.domain.ReservationRoomEvent;
import com.flour.web.mapper.ReservationRoomMapper;

@Service
public class ReservationRoomServiceImpl implements ReservationRoomService {
	
	@Autowired
	ReservationRoomMapper reservationmapper;
	
	//일정추가
	@Override
	public void createEvent(ReservationRoomEvent event) throws Exception{
		//start와 end를 우선 알맞은 날짜형태로 변형
		event.getStartDateAsDate();
		event.getEndDateAsDate(); //dto에 따로 정의해둔 메소드
		reservationmapper.createEvent(event);		
	}

	
	//일정 편집
	@Override
	public void updateEvent(ReservationRoomEvent event) throws Exception {
		//start와 end를 우선 알맞은 날짜형태로 변형
		event.getStartDateAsDate();
		event.getEndDateAsDate(); //dto에 따로 정의해둔 메소드
		reservationmapper.updateEvent(event);
	}

	
	
	//일정 삭제
	@Override
	public void deleteEvent(String id, String location) throws Exception {
		
		reservationmapper.deleteEvent(id, location);
	}

	//일정 정보 가져오기
	@Override
	public List<ReservationRoomEvent> getReservation() throws Exception {

		List<ReservationRoomEvent> events = reservationmapper.getReservation();
		return events;
	}
	
	
}
