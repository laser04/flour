package com.flour.web.controller;


import com.flour.web.domain.Introduce;
import com.flour.web.service.IntroduceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IntroduceController {
    @Autowired
    private IntroduceService introduceService;

    public IntroduceController() {
    }



    @GetMapping({"/introduce/edit"})
    public ModelAndView editIntroduce(@RequestParam("id") String id) throws Exception {
        ModelAndView mav = new ModelAndView("/common/introduceRegister");
        mav.addObject("introduce", introduceService.getEdit(id));
        return mav;
    }

    @PostMapping({"/introduce/edit"})
    public String updateIntroduce(@RequestParam("id") String id, @RequestParam("title") String title, @RequestParam("content") String content) throws Exception {
        Introduce dto = new Introduce();
        dto.setID(id);
        dto.setTITLE(title);
        dto.setCONTENT(content);
        this.introduceService.updateIntroduce(dto);
        return "redirect:/introduce";
    }
}
