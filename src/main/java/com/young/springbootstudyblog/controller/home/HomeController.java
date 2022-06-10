package com.young.springbootstudyblog.controller.home;

import com.young.springbootstudyblog.controller.ExtendsController;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;

/**
 * Date : 2022-05-18
 * Author : zilet
 * Project : studyblog
 * Description :
 */
@RequiredArgsConstructor
@Controller
public class HomeController extends ExtendsController {



    @RequestMapping("/")
    public RedirectView root_(){
        return new RedirectView("/introduce");
    }

    @GetMapping("/home")
    public String home(HttpServletRequest request, Model model){
        model.addAttribute("name", "LMS 시스템과 함께 하세요... ");
        model.addAttribute("introduce", "LMS 시스템에 오신걸 환영합니다. \n LMS 시스템에는 학습지 Blog 와 LMS 시스템에 관련한 많은 이야기가 있습니다.");
        return getPath("/home");
    }




    /* POST */
    @PostMapping(value = "/req/info")
    @ResponseBody
    public String info(HttpServletRequest request, @RequestBody String data) {
        String result = "";
        return result;
    }

}
