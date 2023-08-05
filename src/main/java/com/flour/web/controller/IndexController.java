package com.flour.web.controller;

import com.flour.web.annotation.CurrentUser;
import com.flour.web.domain.BoardNews;
import com.flour.web.domain.BoardNotice;
import com.flour.web.domain.Users;
import com.flour.web.service.BoardNewsService;
import com.flour.web.service.BoardNoticeService;
import com.flour.web.service.UserService;
import com.flour.web.validform.joinForm;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;


/**
 * <pre>
 * 단순 페이지 요청을 처리하여 view를 return하는 컨트롤러
 *
 * </pre>
**/
@Controller
@RequiredArgsConstructor
public class IndexController {

    private final UserService userService;
    private final BoardNoticeService boardNoticeService;
    private final BoardNewsService boardNewsService;

    @GetMapping("/")
    public String index(@CurrentUser Users users, Model model) throws Exception {
        if(users != null) {
            model.addAttribute(users);
        }
        //공지 인덱스 정보
        List<BoardNotice> boardnotice=boardNoticeService.indexBoardNotice();
        model.addAttribute("boardNotice",boardnotice);

        //뉴스 인덱스 정보
        List<BoardNews> boardNewsList=boardNewsService.indexBoardNews();
        model.addAttribute("boardNewsList",boardNewsList);
        return "/index";
    }

    /**
     * <pre>
     * 로그인 페이지
     * </pre>
     *
     * @return 로그인 페이지를 조회한다.
     */
    @GetMapping("/login")
    public String login() {
        return "/user/login";
    }
    /**
     * <pre>
     * 결재 페이지
     * </pre>
     *
     * @return 결제 페이지 조회한다.
     */
    @GetMapping("/document")
    public String document(){
        return "/document/documentPayment";
    }
    /**
     * <pre>
     * 회원 가입페이지
     * </pre>
     * @return 메인 페이지를 조회한다.
     */
    @GetMapping("/join")
    public String signUpForm(Model model) {
        // signUpForm 생략가능 camelCase에 의해서
        model.addAttribute("joinForm", new joinForm());
        return "/user/join";
    }
    /**
     * <pre>
     * 내 정보 페이지
     * </pre>
     *
     * @return 내 정보 페이지를 조회한다.
     */
    @GetMapping("/introduce")
    public String introduce(){
        return "common/introduce";
    }


    @GetMapping("/allUsers")
    public ResponseEntity<?> chatting(@CurrentUser Users users){
        List<Users> allUsersExceptCurrent = userService.getAllUsersExceptCurrent(users);
        return ResponseEntity.ok(allUsersExceptCurrent);
    }

}
