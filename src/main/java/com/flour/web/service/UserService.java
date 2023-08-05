package com.flour.web.service;

import com.flour.web.domain.Users;
import com.flour.web.validform.joinForm;
import com.flour.web.validform.UserProfileForm;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface UserService {
    Users processNewUser(joinForm joinForm);

    Users findByIdennum(String userIdennum);

    public boolean existByEmail(String email);
    List<Users> listAll();
    List<Users> listAllDetail();

    List<Users> listDepartment();
    int CountAllUser();

    void updateEmailVerified(Users users);

    void login(Users users);

    void sendSignUpConfirmEmail(Users users);

    void completedSignUp(Users users);

    void updateUserProfile(Users users, UserProfileForm userProfileForm);

    void updatePassword(Users users, String newPassword);

    List<Users> getAllUsersExceptCurrent(Users users);
}
