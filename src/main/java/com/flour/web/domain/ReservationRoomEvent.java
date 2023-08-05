package com.flour.web.domain;




import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import lombok.Getter;

import lombok.Setter;


@Getter
@Setter
public class ReservationRoomEvent {
	
	    private String id; //게시판아이디
	    private String location; //유저아이디
	    private String calendarId;
	    private String title;
	    private String start;	   
	    private String end;
	    private String state;
	    
	    // 시작 시간과 종료 시간의 문자열을 올바른 시간대로 변환하고, 출력 문자열 형식에 맞게 포맷을 변경하는 과정
	    	//시작시간
	    	public void getStartDateAsDate() throws Exception {
	    	  DateTimeFormatter inputFormatter = DateTimeFormatter.ISO_DATE_TIME;
	    	  DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

	    	  ZonedDateTime startDate = ZonedDateTime.parse(this.start, inputFormatter);
	    	  LocalDateTime localStartDate = startDate.withZoneSameInstant(ZoneId.systemDefault()).toLocalDateTime();
	    	  this.start = outputFormatter.format(localStartDate);
	    	}
	    	//종료시간
	    	public void getEndDateAsDate() throws Exception {
	    	  DateTimeFormatter inputFormatter = DateTimeFormatter.ISO_DATE_TIME;
	    	  DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

	    	  ZonedDateTime endDate = ZonedDateTime.parse(this.end, inputFormatter);
	    	  LocalDateTime localEndDate = endDate.withZoneSameInstant(ZoneId.systemDefault()).toLocalDateTime();
	    	  this.end = outputFormatter.format(localEndDate);
	    	}
	    
	 
} 
