package com.flour.web.service;


import com.flour.web.config.AppProperties;
import com.flour.web.domain.Users;
import com.flour.web.dto.UserAccountDto;
import com.flour.web.mail.EmailMessage;
import com.flour.web.mail.EmailService;
import com.flour.web.mapper.UserMapper;
import com.flour.web.validform.joinForm;
import com.flour.web.validform.UserProfileForm;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.modelmapper.ModelMapper;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Slf4j
@Service
@Component
@RequiredArgsConstructor
public class UserServiceImpl implements UserService , UserDetailsService {

    private final UserMapper userMapper;

    private final EmailService emailService;
    private final PasswordEncoder passwordEncoder;
    private final ModelMapper modelMapper;
    private final AppProperties appProperties;

    @Override
    public Users processNewUser(joinForm joinForm) {
        Users users = insertUser(joinForm);
        sendSignUpConfirmEmail(users);
        return users;
    }
    @Override
    public Users findByIdennum(String userIdennum) {
        return userMapper.findByIdennum(userIdennum);
    }
    @Override
    public int CountAllUser() {
        return userMapper.countAllUser();
    }
    @Override
    public List<Users> listAll() {
        return userMapper.findAll();
    }
    @Override
    public List<Users> listAllDetail(){return userMapper.findAllDetail();}
    public List<Users> listDepartment(){return userMapper.findDepartmentAll();}
    @Override
    public void updateEmailVerified(Users users) {
        userMapper.updateEmailVerified(users);
    }
    @Override
    public void login(Users users) {
        UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(
                new UserAccountDto(users),
                users.getUserPassword(),
                List.of(new SimpleGrantedAuthority("ROLE_USER")));
        SecurityContextHolder.getContext().setAuthentication(token);
    }

    private Users insertUser(joinForm joinForm) {
        String randomId = UUID.randomUUID().toString();
        Users users = Users.builder()
                .userId(randomId)
                .userName(joinForm.getName())
                .userIdennum(joinForm.getIdennum())
                .userPassword(passwordEncoder.encode(joinForm.getPassword()))
                .userEmail(joinForm.getEmail())
                .userPhoto(joinForm.getPhoto())
                .userAddressPostnum(joinForm.getAddress_postnum())
                .userAddressBasic(joinForm.getAddress_basic())
                .userAddressDetail(joinForm.getAddress_detail())
                .userPhone(joinForm.getPhone())
                .userGender(joinForm.getGender())
                .departmentName(joinForm.getDepartment())
                .build();
        users.generateEmailCheckToken();
        userMapper.insertUser(users);
        return users;
    }
    @Override
    public void sendSignUpConfirmEmail(Users users) {
        users.generateEmailCheckToken();
        userMapper.updateEmailCheckTokenWithTime(users);
        String link = "/check_email-token?token=" + users.getUserEmailCheckToken()
                + "&userIdennum=" + users.getUserIdennum();
        String message = "<!DOCTYPE html><html><head><title>밀가루였다</title><meta charset='UTF-8'></head><body><div><div><h2>안녕하세요 " + users.getUserName()
                + "님</h2><p>입사를 완료하려면 아래 링크를 클릭하세요</p><div><a href='" + appProperties.getHost() + link
                + "'>가입인증</a><p>링크가 동작하지 않는 경우에는 아래 URL을 브라우저에 복사해서 붙여 넣으세요</p><small>"
                + appProperties.getHost() + link + "</small></div></div><br/><footer><small>밀가루였다&copy;2023</small></footer></div></body></html>";

        EmailMessage emailMessage = EmailMessage.builder()
                .to(users.getUserEmail())
                .subject("회원 가입 인증")
                .message(message)
                .build();
        emailService.sendEmail(emailMessage);

    }

    @Override
    public void completedSignUp(Users users) {
        users.setUserEmailVerified(true); // 인증 결과를 업데이트 완료
        updateEmailVerified(users);
        login(users);
    }

    @Override
    public void updateUserProfile(Users users, UserProfileForm userProfileForm) {

        modelMapper.map(userProfileForm, users);
        users.setUserModDate(LocalDateTime.now());
        userMapper.updateUserProfile(users);
    }

    @Override
    public void updatePassword(Users users, String newPassword) {
        users.setUserPassword(passwordEncoder.encode(newPassword));
        users.setUserModDate(LocalDateTime.now());
        userMapper.updateUserPassword(users);
    }

    // 스프링 시큐리티 로그인 처리
    @Override
    public UserDetails loadUserByUsername(String idennum) throws UsernameNotFoundException {
        Users users = userMapper.findByIdennum(idennum);
        if(users == null) {
            throw new UsernameNotFoundException(idennum);
        }
        return new UserAccountDto(users);
    }

    @Override
    public List<Users> getAllUsersExceptCurrent(Users users) {
        List<Users> allUsers = userMapper.findAll();
        return allUsers.stream()
                .filter(user -> !user.getUserIdennum().equals(users.getUserIdennum()))
                .collect(Collectors.toList());
    }
    @Override
    public boolean existByEmail(String email){
        return userMapper.existByEmail(email);
    }
}



	

