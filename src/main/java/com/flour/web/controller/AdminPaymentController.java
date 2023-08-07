package com.flour.web.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;


import com.flour.web.annotation.CurrentUser;
import com.flour.web.domain.DocumentPayment;
import com.flour.web.domain.Users;
import com.flour.web.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.flour.web.service.AdminService;

@Controller
@RequiredArgsConstructor
public class AdminPaymentController {

    private final AdminService adminservice;
    private final UserService userService;

    //관리자 첫페이지
    @GetMapping("/admin")
    public ModelAndView admin(@CurrentUser Users users) throws Exception {
        //휴가신청서 모든 정보들
        ArrayList<DocumentPayment> holidayList
                = (ArrayList<DocumentPayment>) adminservice.holidayList();
        //업무보고서 모든 정보들
        ArrayList<DocumentPayment> taskreportList
                = (ArrayList<DocumentPayment>) adminservice.taskreportList();
        //사직서 모든 정보들
        ArrayList<DocumentPayment> resignationList
                = (ArrayList<DocumentPayment>) adminservice.resignationList();

        //3 테이블 전부 check항목  null로 업데이트 시키기
        adminservice.AllCheckNull();


        ModelAndView mav = new ModelAndView("/user/adminPage");
        mav.addObject("userInfo", users);
        mav.addObject("holidayList", holidayList);
        mav.addObject("taskreportList", taskreportList);
        mav.addObject("resignationList", resignationList);
        mav.addObject("allusers", userService.listAllDetail());
        return mav;
    }
    @GetMapping("/admin/getUsers")
    public ResponseEntity<?> getUsers(){
        return ResponseEntity.ok(userService.listAllDetail());
    }
    @GetMapping("/admin/getDepartment")
    public ResponseEntity<?> getDepartments(){
        return ResponseEntity.ok(userService.listDepartment());
    }
    //휴가신청서 체크(AJAX)
    @PutMapping("/admin/holidaycheck")
    public ResponseEntity<String> holidayCheck(
            @RequestParam("DOCUMENTHOLIDAYNUM") String DOCUMENTHOLIDAYNUM) throws Exception {

        adminservice.holidayCheck(DOCUMENTHOLIDAYNUM);
        return new ResponseEntity<>("holidayCheck!", HttpStatus.OK);
    }

    //휴가신청서 체크해제(AJAX)
    @PutMapping("/admin/holidayuncheck")
    public ResponseEntity<String> holidayUnCheck(
            @RequestParam("DOCUMENTHOLIDAYNUM") String DOCUMENTHOLIDAYNUM) throws Exception {

        adminservice.holidayunCheck(DOCUMENTHOLIDAYNUM);
        return new ResponseEntity<>("holidayUnCheck!", HttpStatus.OK);
    }

    //업무보고서 체크(AJAX)
    @PutMapping("/admin/taskreportcheck")
    public ResponseEntity<String> taskreportCheck(
            @RequestParam("DOCUMENTTASKREPORTNUM") String DOCUMENTTASKREPORTNUM) throws Exception {

        adminservice.taskreportCheck(DOCUMENTTASKREPORTNUM);
        return new ResponseEntity<>("taskreportCheck!", HttpStatus.OK);
    }

    //업무보고서 체크해제(AJAX)
    @PutMapping("/admin/taskreportuncheck")
    public ResponseEntity<String> taskreportUnCheck(
            @RequestParam("DOCUMENTTASKREPORTNUM") String DOCUMENTTASKREPORTNUM) throws Exception {

        adminservice.taskreportUnCheck(DOCUMENTTASKREPORTNUM);
        return new ResponseEntity<>("taskreportUnCheck!", HttpStatus.OK);
    }

    //사직서 체크(AJAX)
    @PutMapping("/admin/resignationcheck")
    public ResponseEntity<String> resignationCheck(
            @RequestParam("DOCUMENTRESIGNATIONNUM") String DOCUMENTRESIGNATIONNUM) throws Exception {

        adminservice.resignationCheck(DOCUMENTRESIGNATIONNUM);
        return new ResponseEntity<>("resignationCheck!", HttpStatus.OK);
    }

    //사직서 체크해제(AJAX)
    @PutMapping("/admin/resignationuncheck")
    public ResponseEntity<String> resignationUnCheck(
            @RequestParam("DOCUMENTRESIGNATIONNUM") String DOCUMENTRESIGNATIONNUM) throws Exception {

        adminservice.resignationUnCheck(DOCUMENTRESIGNATIONNUM);
        return new ResponseEntity<>("resignationUnCheck!", HttpStatus.OK);
    }
 

    // 결제 버튼 클릭(결제 처리)
    @PostMapping("/admin/approvalcomplete")
    public ResponseEntity<String> paymentComplete(@CurrentUser Users users) throws Exception {
        adminservice.paymentComplete(users.getUserIdennum(), users.getUserName(), users.getDepartmentName());
        // 결제 처리가 완료된 후에 관리자 페이지로 리디렉션
        return ResponseEntity.status(HttpStatus.FOUND).header("Location", "/admin").build();
    }

    // 반려 버튼 클릭(반려 처리)
    @PostMapping("/admin/approvalreject")
    public ResponseEntity<String> paymentReject(@CurrentUser Users users) throws Exception {
        adminservice.paymentReject(users.getUserIdennum(), users.getUserName(), users.getDepartmentName());
        // 반려 처리가 완료된 후에 관리자 페이지로 리디렉션
        return ResponseEntity.status(HttpStatus.FOUND).header("Location", "/admin").build();
    }

    // 결재 대기 또는 반려 삭제
    @PostMapping("/admin/approvaldelete")
    public ResponseEntity<String> paymentDelete() throws Exception {
        adminservice.paymentDelete();
        // 삭제 처리가 완료된 후에 관리자 페이지로 리디렉션
        return ResponseEntity.status(HttpStatus.FOUND).header("Location", "/admin").build();
    }


}
