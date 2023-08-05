package com.flour.web.validform;

import lombok.Data;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.URL;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

@Data
public class UserProfileForm {

    @NotBlank
    @Email
    private String email;

    @NotBlank
    @Length(max = 13)
    private String phone;

    private String photo;
    private String address_postnum;
    private String address_basic;
    private String address_detail;
}