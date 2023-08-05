package com.flour.web.validator;

import com.flour.web.mapper.UserMapper;
import com.flour.web.validform.joinForm;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
@RequiredArgsConstructor
public class JoinFormValidator implements Validator {

    private final UserMapper userMapper;
    @Override
    public boolean supports(Class<?> clazz) {
        return clazz.isAssignableFrom(joinForm.class);
    }

    @Override
    public void validate(Object o, Errors errors) {
        joinForm joinForm = (joinForm) o;
        if(userMapper.existByIdennum(joinForm.getIdennum())) {
            errors.rejectValue("idennum" , "invalid.idennum", new Object[]{joinForm.getIdennum()}, "이미 존재하는 사번입니다.");
        }
    }
}
