package com.young.springbootstudyblog.controller.introduce;

import com.young.springbootstudyblog.controller.ExtendsController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * Date : 2022-05-24
 * Author : zilet
 * Project : studyblog
 * Description :
 */
@Controller
public class IntroduceController extends ExtendsController {

    @GetMapping("/introduce")
    public String home(HttpServletRequest request, Model model){
        model.addAttribute("name", "LMS 시스템과 함께 하세요... ");
        model.addAttribute("introduce", "LMS 시스템에 오신걸 환영합니다. \n LMS 시스템에는 학습지 Blog 와 LMS 시스템에 관련한 많은 이야기가 있습니다.");

        return getPath("/introduce");
    }

}
