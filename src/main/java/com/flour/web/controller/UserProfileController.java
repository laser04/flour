package com.flour.web.controller;

import com.flour.web.annotation.CurrentUser;
import com.flour.web.domain.Users;
import com.flour.web.service.UserService;
import com.flour.web.validator.UserPasswordFormValidator;
import com.flour.web.validform.UserPasswordForm;
import com.flour.web.validform.UserProfileForm;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class UserProfileController {

    static final String USER_UPDATE_URL = "/user/update";
    static final String USER_UPDATE_PROFILE_API = "/user/update/profile";
    static final String USER_UPDATE_PASSWORD_API = "/user/update/password";
    static final String USER_UPDATE_VIEW_NAME = "/user/user_update";

    private final UserService userService;

    @InitBinder("userPasswordForm")
    public void initBinder(WebDataBinder webDataBinder) {
        webDataBinder.addValidators(new UserPasswordFormValidator());
    }


    @GetMapping(USER_UPDATE_URL)
    public String userProfileForm(@CurrentUser Users users, Model model) {
        model.addAttribute(users);
        return USER_UPDATE_VIEW_NAME;
    }

    @PostMapping(USER_UPDATE_PROFILE_API)
    public String updateUserProfile(@CurrentUser Users users, @Valid @ModelAttribute UserProfileForm userProfileForm,
                                    Errors errors, Model model, RedirectAttributes attributes) {
        System.out.println(userProfileForm);
        if(errors.hasErrors()) {
            Map<String,String> map = new HashMap<>();
            for(FieldError error :errors.getFieldErrors()) {
                map.put(error.getField() , error.getDefaultMessage());
            }
            model.addAttribute("errors",map);
            model.addAttribute("tabInfo", "profile");
            model.addAttribute(users);
            return USER_UPDATE_VIEW_NAME;
        }
        userService.updateUserProfile(users, userProfileForm);
        attributes.addFlashAttribute("tabInfo","profile");
        attributes.addFlashAttribute("message", "프로필을 수정했습니다.");

        return "redirect:" + USER_UPDATE_URL;
    }

    @PostMapping(USER_UPDATE_PASSWORD_API)
    public String updateUserPassword(@CurrentUser Users users, @Valid UserPasswordForm userPasswordForm, Errors errors ,
                                     Model model, RedirectAttributes attributes) {
        if(errors.hasErrors()) {
            Map<String,String> map = new HashMap<>();
            for(FieldError error :errors.getFieldErrors()) {
                map.put(error.getField() , error.getDefaultMessage());
            }
            model.addAttribute("errors",map);
            model.addAttribute("tabInfo", "password");
            model.addAttribute(users);
            return USER_UPDATE_VIEW_NAME;
        }
        userService.updatePassword(users, userPasswordForm.getNewPassword());
        attributes.addFlashAttribute("tabInfo", "password");
        attributes.addFlashAttribute("message", "비밀번호를 변경하였습니다.");

        return "redirect:" + USER_UPDATE_URL;
    }
}
