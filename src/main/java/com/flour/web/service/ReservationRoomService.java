package com.flour.web.service;

import java.util.List;

import com.flour.web.domain.ReservationRoomEvent;

public interface ReservationRoomService {
	
	//일정추가
	public void createEvent(ReservationRoomEvent event) throws Exception;
	
	//일정 편집
	public void updateEvent(ReservationRoomEvent event) throws Exception;
	
	//일정 삭제
	public void deleteEvent(String id, String location ) throws Exception;
	
	//일정정보 가져오기
	public List<ReservationRoomEvent> getReservation() throws Exception;
}
