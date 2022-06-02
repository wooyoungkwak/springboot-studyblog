package com.young.studyblog.controller.contact;

import com.young.studyblog.controller.ExtendsController;
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
public class ContactController extends ExtendsController {

    @GetMapping("/contact")
    public String contact(Model model){
        model.addAttribute("name", "LMS 시스템 관련 문의 ");
        model.addAttribute("introduce", "LMS 시스템에 관련된 궁금증이 있다면 메일로 저희에게 알려주세요. ");
        return getPath("/contact");
    }

}
