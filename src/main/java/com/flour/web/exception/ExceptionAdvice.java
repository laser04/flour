package com.flour.web.exception;

import com.flour.web.annotation.CurrentUser;
import com.flour.web.domain.Users;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import javax.servlet.http.HttpServletRequest;

@Slf4j
@ControllerAdvice
public class ExceptionAdvice {

    @ExceptionHandler
    public String handleRuntimeException(@CurrentUser Users users, HttpServletRequest req, RuntimeException e) {
        if(users != null) {
            log.info("'{}' requested '{}'", users.getUserIdennum(), req.getRequestURI());
        } else {
            log.info("requested '{}'" , req.getRequestURI());
        }
        log.error("bad request", e);
        return "/error/error";
    }
}
