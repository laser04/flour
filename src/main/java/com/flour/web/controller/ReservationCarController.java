package com.flour.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.flour.web.domain.ReservationCar;
import com.flour.web.service.ReservationCarService;

@Controller
public class ReservationCarController {
	
	@Autowired
	ReservationCarService reservationcarService;
	
	//예약-회의실 이동
	@GetMapping("/reservation")
	public ModelAndView moveReservation() throws Exception {

		List<ReservationCar> carList=reservationcarService.carCategoryList();
		ModelAndView mav = new ModelAndView("/common/reservation");
		mav.addObject("carList",carList);
		
		return mav;
	}
	
	//차량 신청
	@PostMapping("/reservation/reservationRequest")
	public ModelAndView reservationRequest(ReservationCar dto) throws Exception {
		reservationcarService.reservationRequest(dto);
        return new ModelAndView("redirect:/reservation");
	}
	
	// 차량 요청 승인
	@PostMapping("/reservation/requestaccept")
	public ModelAndView requestAccept(@RequestParam("RESERVATIONCARID") String RESERVATIONCARID,
	    @RequestParam("RESERVATIONCARSTATUS") String RESERVATIONCARSTATUS) throws Exception {
	  reservationcarService.requestAccept(RESERVATIONCARID, RESERVATIONCARSTATUS);
	  return new ModelAndView("redirect:/reservation");
	}

	// 차량 사용 완료 (승인 완료->신청으로 바뀌게)
	@PostMapping("/reservation/usecomplete")
	public ModelAndView useComplete(@RequestParam("RESERVATIONCARID") String RESERVATIONCARID,
	    @RequestParam("RESERVATIONCARSTATUS") String RESERVATIONCARSTATUS) throws Exception {

	  reservationcarService.useComplete(RESERVATIONCARID, RESERVATIONCARSTATUS);
	  return new ModelAndView("redirect:/reservation");
	}
	
	//차량 반려
	@PostMapping("/reservation/carreject")
	public ModelAndView carReject(ReservationCar dto) throws Exception {

		reservationcarService.carReject(dto);
        return new ModelAndView("redirect:/reservation");
	}
	

}
