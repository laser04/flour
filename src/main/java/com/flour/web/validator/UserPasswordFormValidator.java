package com.flour.web.validator;

import com.flour.web.validform.UserPasswordForm;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

public class UserPasswordFormValidator implements Validator {
    @Override
    public boolean supports(Class<?> clazz) {
        return UserPasswordForm.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        UserPasswordForm passwordForm = (UserPasswordForm) target;
        if(!passwordForm.getNewPassword().equals(passwordForm.getNewPasswordConfirm())) {
            errors.rejectValue("newPassword", "wrong.value","입력한 새 패스워드가 서로 일치하지 않습니다.");
        }
    }

}
