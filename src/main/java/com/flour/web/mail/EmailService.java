package com.flour.web.mail;

import org.springframework.stereotype.Service;

@Service
public interface EmailService {

    void sendEmail(EmailMessage emailMessage);
}
