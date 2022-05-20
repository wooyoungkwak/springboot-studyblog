package com.young.studyblog.controller.home;

import com.google.common.collect.Maps;
import com.young.studyblog.controller.ExtendsController;
import com.young.studyblog.model.dto.home.domain.Blog;
import com.young.studyblog.model.dto.home.enums.Grade;
import com.young.studyblog.model.dto.home.enums.Subject;
import com.young.studyblog.model.dto.home.service.BlogService;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Date : 2022-05-18
 * Author : zilet
 * Project : studyblog
 * Description :
 */
@RequiredArgsConstructor
@Controller
public class HomeController extends ExtendsController {

    private final BlogService blogService;

    @RequestMapping("/")
    public RedirectView root_(){
        return new RedirectView("/home");
    }

    @GetMapping("/home")
    public String home(HttpServletRequest request, Model model){
        model.addAttribute("name", "LVM 시스템과 함께 하세요... ");
        model.addAttribute("introduce", "LVM 시스템에 오신걸 환영합니다. \n LVM 시스템에는 학습지 Blog 와 LMMS 시스템에 관련한 많은 이야기가 있습니다.");
        return getPath("/home");
    }

    @GetMapping("/about")
    public String about(Model model){
        model.addAttribute("name", "LVM 시스템에 대해서 ... ");
        model.addAttribute("introduce", "LVM 시스템에 관련된 이야기를 들어보세요. ");
        return getPath("/about");
    }

    @GetMapping("/contact")
    public String contact(Model model){
        model.addAttribute("name", "LVM 시스템 관련 문의 ");
        model.addAttribute("introduce", "LVM 시스템에 관련된 궁금증이 있다면 메일로 저희에게 알려주세요. ");
        return getPath("/contact");
    }

    @GetMapping("/blog")
    public String blog(HttpServletRequest request, Model model,
                       @RequestParam(defaultValue = "") String searchContent,
                       @RequestParam(defaultValue = "NONE") String category,
                       @RequestParam(defaultValue = "") String sort,
                       @RequestParam(defaultValue = "") String page){

        model.addAttribute("name", "학습지 Blog");
        model.addAttribute("introduce", " 학습지 Blog 는 다양한 학습지를 중학교 1학년 ~ 3학년 / 고등학교 1학년 ~ 3학년 까지 준비가 되어 있습니다. \n 과목은 국어/영어/수학/과학 으로 이루어져 있습니다. ");

        if (StringUtils.isEmpty(page)) {
            page = "1";
            model.addAttribute("page", page);
        } else {
            model.addAttribute("page", page);
        }

        HashMap data = null;
        List<Blog> blogs = null;
        int totalPage = 0;
        HashMap<String, String> parameterMap = getParameterMap(request);
        if ( parameterMap.get("grade") != null) {
            Grade grade = Grade.valueOf(parameterMap.get("grade"));
            data = blogService.getsAllByGrade(grade, Integer.parseInt(page));
            blogs = (List<Blog>) data.get("blogs");
        } if (parameterMap.get("subjet") != null ) {
            Subject subject = Subject.valueOf(parameterMap.get("subjet"));
            data = blogService.getsAllBySubject(subject, Integer.parseInt(page));
            blogs = (List<Blog>) data.get("blogs");
        } else {
            data = blogService.getsAll(Integer.parseInt(page));
            blogs = (List<Blog>) data.get("blogs");
        }

        model.addAttribute("searchContent", searchContent);
        model.addAttribute("category", category);
        model.addAttribute("sort", sort);

        model.addAttribute("blogs", blogs);
        model.addAttribute("blogSize", blogs.size());

        totalPage = (int) data.get("totalPage");
        model.addAttribute("totalPage", totalPage);

        return getPath("/blog");
    }

    @GetMapping("/register")
    public String register(HttpServletRequest request, Model model,
                           @RequestParam(defaultValue = "") String subSeq,
                           @RequestParam(defaultValue = "") String subject,
                           @RequestParam(defaultValue = "") String grade,
                           @RequestParam(defaultValue = "") String contents,
                           @RequestParam(defaultValue = "") String status,
                           @RequestParam(defaultValue = "") String thumbnailUrl){

        model.addAttribute("name", "학습지 Blog");
        model.addAttribute("introduce", " 학습지 Blog 는 다양한 학습지를 중학교 1학년 ~ 3학년 / 고등학교 1학년 ~ 3학년 까지 준비가 되어 있습니다. \n 과목은 국어/영어/수학/과학 으로 이루어져 있습니다. ");

        model.addAttribute("subSeq", subSeq);
        model.addAttribute("subject", subject);
        model.addAttribute("grade", grade);
        model.addAttribute("contents", contents);
        model.addAttribute("status", status);
        model.addAttribute("thumbnailUrl", thumbnailUrl);
        return getPath("/register");
    }

    @GetMapping("/viewer")
    public String viewer(HttpServletRequest request, Model model,
                         @RequestParam(defaultValue = "") String pdfUrl ){

        model.addAttribute("name", "학습지 Blog");
        model.addAttribute("introduce", " 학습지 Blog 는 다양한 학습지를 중학교 1학년 ~ 3학년 / 고등학교 1학년 ~ 3학년 까지 준비가 되어 있습니다. \n 과목은 국어/영어/수학/과학 으로 이루어져 있습니다. ");


        model.addAttribute("pdfUrl", pdfUrl);
        return getPath("/viewer");
    }

    /* POST */
    @PostMapping(value = "/req/info")
    @ResponseBody
    public String info(HttpServletRequest request, @RequestBody String data) {
        String result = "";
        return result;
    }

    private HashMap<String, String> getParameterMap(HttpServletRequest request) {
        HashMap<String, String> resultMap = Maps.newHashMap();
        Enumeration<String> names = request.getParameterNames();
        while (names.hasMoreElements()) {
            String name = names.nextElement();
            resultMap.put(name, request.getParameter(name));
        }
        return resultMap;
    }
}
