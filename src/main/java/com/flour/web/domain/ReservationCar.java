package com.flour.web.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReservationCar {
	
	//RESERVATION_CAR
	private int RESERVATIONCARID;
	private String RESERVATIONCARVALUE;
	private String RESERVATIONCARSTATUS;
	private String RESERVATIONCARIMAGE;
	
	private String RESERVATIONCARUSERID;
	private String RESERVATIONCARSTARTTIME;
	private String RESERVATIONCARENDTIME;
	private String RESERVATIONCARDESTINATION;
	private String RESERVATIONCARUSE;
	private String RESERVATIONCARREJECTREASON; //반려사유
	
}