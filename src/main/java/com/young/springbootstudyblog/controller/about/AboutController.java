package com.young.springbootstudyblog.controller.about;

import com.young.springbootstudyblog.controller.ExtendsController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * Date : 2022-05-24
 * Author : zilet
 * Project : studyblog
 * Description :
 */
@Controller
public class AboutController extends ExtendsController {

    @GetMapping("/about")
    public String about(Model model){
        model.addAttribute("name", "LMS 시스템에 대해서 ... ");
        model.addAttribute("introduce", "LMS 시스템에 관련된 이야기를 들어보세요. ");
        return getPath("/about");
    }

}
