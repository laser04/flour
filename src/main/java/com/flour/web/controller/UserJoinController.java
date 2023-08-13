package com.flour.web.controller;

import com.flour.web.annotation.CurrentUser;
import com.flour.web.domain.Users;
import com.flour.web.service.UserService;
import com.flour.web.validator.JoinFormValidator;
import com.flour.web.validform.joinForm;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.Map;


@Controller
@RequiredArgsConstructor
public class UserJoinController {

    private final UserService userService;

    private final JoinFormValidator joinFormValidator;

    @InitBinder("joinForm")
    public void initBinder(WebDataBinder webDataBinder) {
        webDataBinder.addValidators(joinFormValidator);
    }

    // signUpForm 을 받을때 403 검증도 하고 validator 검증도 한다.
    @PostMapping("/join")
    public String signUpSubmit(@Valid joinForm joinForm, Errors errors, Model model) { // @ModelAttribute 복합(여러값)들을 가진 객체를 받을 때 사용을 하지만 파라미터 가 없어도 되기 때문에 생략이 가능하다.
        System.out.println(joinForm);
        if (errors.hasErrors()) {
            System.out.println(errors);
            Map<String, String> map = new HashMap<>();
            for (FieldError error : errors.getFieldErrors()) {
                map.put(error.getField(), error.getDefaultMessage());
            }
            model.addAttribute("errors", map);
            return "/user/join";
        }
        Users users = userService.processNewUser(joinForm);
        userService.login(users);
        return "redirect:/";
    }

    @GetMapping("/mail_check")
    public ResponseEntity<String> mailcheck(String email) {
        if (userService.existByEmail(email)) {
            return ResponseEntity.ok("작성하신 이메일은 이미 존재합니다.");
        } else {
            return ResponseEntity.ok("중복된 이메일이 없습니다.");
        }
    }

    @GetMapping("/check_email")
    public String checkEmail(@CurrentUser Users users, Model model) {
        model.addAttribute("email", users.getUserEmail());
        return "/user/check_email";
    }

    // 이메일인증을 악의적 동작 막기 위함
    @GetMapping("/resend-confirm-email")
    public String resendConfirmEmail(@CurrentUser Users users, Model model) {
        if (!users.canSendConfirmEmail()) {
            model.addAttribute("error", "인증 이메일은 1시간에 한번만 전송할 수 있습니다.");
            model.addAttribute("email", users.getUserEmail());
            return "/user/check_email";
        }
        userService.sendSignUpConfirmEmail(users);
        return "redirect:/";
    }


    @GetMapping("/check_email-token")
    public String checkEmailToken(String token, String userIdennum, Model model) {
        Users users = userService.findByIdennum(userIdennum);
        String view = "/user/checked_email";
        if (users == null) {
            model.addAttribute("error", "wrong.email");
            return view;
        }

        if (users.isValidToken(token)) {
            model.addAttribute("error", "wrong.token");
            return view;
        }
        userService.completedSignUp(users);

        model.addAttribute("numberOfUser", userService.CountAllUser());
        model.addAttribute("name", users.getUserName());
        return view;
    }

    @GetMapping("/login-by-id")
    public String loginById(String token, String userId, Model model) {
        Users users = userService.findByIdennum(userId);
        String view = "/user/logged_in_by_Id";
        if (users == null || users.isValidToken(token)) {
            model.addAttribute("error", "로그인할 수 없습니다.");
            return view;
        }
        userService.login(users);
        return view;
    }

}