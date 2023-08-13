package com.flour.web.controller;

import com.flour.web.annotation.CurrentUser;
import com.flour.web.domain.Commute;
import com.flour.web.domain.Users;
import com.flour.web.service.CommuteService;
import com.flour.web.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class CommuteController {

    private final CommuteService commuteService;
    Map<String, Object> response = new HashMap<>();

    //출근 체크
    @GetMapping("/user/commute/work_on_check/{userIdennum}")
    public ResponseEntity<Map<String, Object>> checkWorkOn(@PathVariable String userIdennum, @CurrentUser Users users) {
        if (userIdennum.equals(users.getUserIdennum())) {
            boolean isWorkOn = commuteService.workOn(userIdennum);
            if (isWorkOn) {
                response.put("status", 0);
                response.put("message", "출근 처리가 완료되었습니다.");
            } else {
                response.put("status", 1);
                response.put("message", "이미 출근 처리 되어있습니다.");
            }
        } else {
            response.put("message", "정상적인 접근이 아닙니다.");
        }
        return ResponseEntity.ok(response);
    }

    //퇴근 체크
    @GetMapping("/user/commute/work_off_check/{userIdennum}")
    public ResponseEntity<Map<String, Object>> workoff(@PathVariable String userIdennum, @CurrentUser Users users) {
        if (userIdennum.equals(users.getUserIdennum())) {
            boolean isWorkOn = commuteService.checkWorkOn(userIdennum);
            if (isWorkOn) {
                boolean isWorkOff = commuteService.workOff(userIdennum);
                if (isWorkOff) {
                    response.put("status", 0);
                    response.put("message", "퇴근 처리가 완료되었습니다.");
                } else {
                    response.put("status", 1);
                    response.put("message", "이미 퇴근 처리 되어있습니다.");
                }
            } else {
                response.put("status", -1);
                response.put("message", "출근하지 않았습니다.");
            }
            return ResponseEntity.ok(response);
        } else {
            response.put("message", "정상적인 접근이 아닙니다.");
            return ResponseEntity.ok(response);
        }
    }

    //전체 출퇴근 체크
    @GetMapping("/user/commute/check/{userIdennum}")
    public ResponseEntity<?> commuteCheck(@PathVariable String userIdennum, @CurrentUser Users users) {
        if (userIdennum.equals(users.getUserIdennum())) {
            return ResponseEntity.ok(commuteService.commuteCheck(userIdennum));
        } else {
            response.put("message", "정상적인 접근이 아닙니다.");
            return ResponseEntity.ok(response);
        }
    }
}
