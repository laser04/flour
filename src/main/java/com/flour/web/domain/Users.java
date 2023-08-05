package com.flour.web.domain;

import lombok.*;

import java.time.LocalDateTime;
import java.util.UUID;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of = "userId")
@Getter
@Setter
@ToString(exclude = "userPassword")
public class Users {
    private String userId;
    private String userIdennum;
    private String userPassword;
    private String userName;
    private String userGender;
    private String userEmail;
    private String departmentId;
    private String departmentName;
    private String userPosition;
    private String userPhone;
    private String userPhoto;
    private UsersStatus userRole;
    private String userAddressPostnum;
    private String userAddressBasic;
    private String userAddressDetail;
    private LocalDateTime userCreatedDate;
    private LocalDateTime userModDate;

    private boolean userEmailVerified;
    private String userEmailCheckToken;
    private LocalDateTime userEmailCheckTokenGeneratedAt;

    public void generateEmailCheckToken() {
        this.userEmailCheckToken = UUID.randomUUID().toString();
        this.userEmailCheckTokenGeneratedAt = LocalDateTime.now();
    }

    public boolean isValidToken(String token) {
        return this.userEmailCheckToken.equals(token);
    }

    public boolean canSendConfirmEmail() {
        return this.getUserEmailCheckTokenGeneratedAt().isBefore(LocalDateTime.now().minusHours(1));
    }
}
