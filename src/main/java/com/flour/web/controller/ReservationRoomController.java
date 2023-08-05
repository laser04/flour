package com.flour.web.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.flour.web.domain.ReservationRoomEvent;
import com.flour.web.service.ReservationRoomService;

@RestController	
public class ReservationRoomController {
	
	@Autowired
	ReservationRoomService reservationservice;
	
	//일정 추가
	@PostMapping("/reservation/createevent")
    public ResponseEntity<String> createEvent(@RequestBody ReservationRoomEvent event) throws Exception {
		
		reservationservice.createEvent(event);
      return new ResponseEntity<>("Event created!", HttpStatus.CREATED);

	}

	//일정 편집
    @PutMapping("/reservation/updateevent")
    public ResponseEntity<String> updateEvent( @RequestBody ReservationRoomEvent event) throws Exception {
    	
    	reservationservice.updateEvent(event);
      return new ResponseEntity<>("Event updated!", HttpStatus.OK);
    }
    
    //일정 삭제
    @DeleteMapping("/reservation/deleteevent")
    public ResponseEntity<String> deleteEvent(@RequestParam("id") String id
    		, @RequestParam("location") String location)  throws Exception{
   
    	reservationservice.deleteEvent(id, location);
      return new ResponseEntity<>("Event deleted!", HttpStatus.OK);
    }
    
    
	
	  @GetMapping("/reservation/getreservation") 
	  public ResponseEntity<List<ReservationRoomEvent>> getReservation() throws Exception{ // 데이터베이스에서 저장된 이벤트 정보 가져오기 로직을 여기에 구현하세요.

	  List<ReservationRoomEvent> events = reservationservice.getReservation();
	  return new ResponseEntity<>(events, HttpStatus.OK); 
	  }
	
    
	
}
