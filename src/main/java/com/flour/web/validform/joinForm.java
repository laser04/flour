package com.flour.web.validform;

import lombok.Data;
import lombok.ToString;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

@Data
@ToString
public class joinForm {
    @NotBlank(message = "사번은 9자리의 숫자로 입력해주세요")
    @Length(min = 9, max = 9)
    @Pattern(regexp = "^[0-9]+$")
    private String idennum;

    @NotBlank
    @Length(min = 2, max = 10)
    private String name;

    @NotBlank
    @Length(min = 8, max = 50)
    private String password;

    @NotBlank
    @Email
    private String email;

    @NotBlank
    @Length(max = 13)
    private String phone;

    private String gender;
    private String department;
    private String photo;
    private String address_postnum;
    private String address_basic;
    private String address_detail;

}

