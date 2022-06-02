package com.young.studyblog.controller.service;

import com.young.studyblog.controller.ExtendsController;
import com.young.studyblog.model.dto.home.domain.Blog;
import com.young.studyblog.model.dto.home.enums.Grade;
import com.young.studyblog.model.dto.home.enums.Subject;
import com.young.studyblog.model.dto.home.service.BlogService;
import com.young.studyblog.util.WebUtils;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

/**
 * Date : 2022-05-24
 * Author : zilet
 * Project : studyblog
 * Description :
 */
@RequiredArgsConstructor
@Controller
public class ServiceController extends ExtendsController {

    private final BlogService blogService;

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
        HashMap<String, String> parameterMap = WebUtils.getParameterMap(request);
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

    @GetMapping("/viewer")
    public String viewer(HttpServletRequest request, Model model,
                         @RequestParam(defaultValue = "") String pdfUrl ){

        model.addAttribute("name", "학습지 Blog");
        model.addAttribute("introduce", " 학습지 Blog 는 다양한 학습지를 중학교 1학년 ~ 3학년 / 고등학교 1학년 ~ 3학년 까지 준비가 되어 있습니다. \n 과목은 국어/영어/수학/과학 으로 이루어져 있습니다. ");


        model.addAttribute("pdfUrl", pdfUrl);
        return getPath("/viewer");
    }


}
