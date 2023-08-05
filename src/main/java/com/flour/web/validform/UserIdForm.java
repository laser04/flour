package com.flour.web.validform;

import lombok.Data;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

@Data
public class UserIdForm {

    @NotBlank
    @Length(min = 9,max = 9 )
    @Pattern(regexp = "^[0-9]+$")
    private String userIdennum;
}
