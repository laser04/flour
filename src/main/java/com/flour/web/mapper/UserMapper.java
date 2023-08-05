package com.flour.web.mapper;

import com.flour.web.domain.Users;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional(readOnly = false) // 트랜잭션 가입 허용 여부
public interface UserMapper {

    boolean existByIdennum(String userIdennum);
    boolean existByEmail(String userEmail);
    void insertUser(Users users);
    int countAllUser();
    List<Users> findAll();
    List<Users> findAllDetail();
    List<Users> findDepartmentAll();
    void updateEmailVerified(Users users);
    Users findByIdennum(String userIdennum);
    void updateUserProfile(Users users);
    void updateUserPassword(Users users);
    void updateEmailCheckTokenWithTime(Users users);
    void deleteById(String id);
}
