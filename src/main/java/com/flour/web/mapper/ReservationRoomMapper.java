package com.flour.web.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.flour.web.domain.ReservationRoomEvent;

@Mapper
public interface ReservationRoomMapper {
	
	//일정추가
	public void createEvent(ReservationRoomEvent event) throws Exception;
	
	//일정 편집
	public void updateEvent(ReservationRoomEvent event) throws Exception;
	
	//일정 삭제
	public void deleteEvent( String id, String location ) throws Exception;
	
	//일정정보 가져오기
	public List<ReservationRoomEvent> getReservation() throws Exception;
}
 