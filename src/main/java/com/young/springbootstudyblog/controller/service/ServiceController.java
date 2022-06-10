package com.young.springbootstudyblog.controller.service;

import com.google.common.collect.Maps;
import com.young.springbootstudyblog.controller.ExtendsController;
import com.young.springbootstudyblog.model.dto.home.domain.Blog;
import com.young.springbootstudyblog.model.dto.home.enums.Grade;
import com.young.springbootstudyblog.model.dto.home.enums.ServiceType;
import com.young.springbootstudyblog.model.dto.home.enums.Sort;
import com.young.springbootstudyblog.model.dto.home.enums.Subject;
import com.young.springbootstudyblog.model.dto.home.service.BlogService;
import com.young.springbootstudyblog.util.WebUtils;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
                       @RequestParam(defaultValue = "NONE", name = "serviceType") String serviceTypeName,
                       @RequestParam(defaultValue = "ASC", name = "sort") String sortName,
                       @RequestParam(defaultValue = "1") String page){

        int totalPage = 0;
        ServiceType serviceType = ServiceType.valueOf(serviceTypeName);

        Sort sort = Sort.valueOf(sortName);
        HashMap<String, Object> data = getData(request, serviceType, sort, searchContent, page);

        List<Blog> blogs = (List<Blog>) data.get("blogs");

        model.addAttribute("searchContent", searchContent);
        model.addAttribute("serviceType", serviceType);

        model.addAttribute("blogs", blogs);
        model.addAttribute("blogSize", blogs.size());

        totalPage = (int) data.get("totalPage");
        model.addAttribute("totalPage", totalPage);

        model.addAttribute("page", page);
        model.addAttribute("sort", sort);
        model.addAttribute("searchContent", searchContent);
        model.addAttribute("name", "학습지 Blog");
        model.addAttribute("introduce", " 학습지 Blog 는 다양한 학습지를 중학교 1학년 ~ 3학년 / 고등학교 1학년 ~ 3학년 까지 준비가 되어 있습니다. \n 과목은 국어/영어/수학/과학 으로 이루어져 있습니다. ");

        return getPath("/blog");
    }

    private HashMap<String, Object> getData(HttpServletRequest request, ServiceType serviceType, Sort sort, String searchContent, String page){
        HashMap<String, String> parameterMap = WebUtils.getParameterMap(request);
        return blogService.getsAll(serviceType, sort, searchContent, Integer.parseInt(page));
    }

    @GetMapping("/viewer")
    public String viewer(HttpServletRequest request, Model model,
                         @RequestParam(defaultValue = "") String pdfUrl ){

        model.addAttribute("name", "학습지 Blog");
        model.addAttribute("introduce", " 학습지 Blog 는 다양한 학습지를 중학교 1학년 ~ 3학년 / 고등학교 1학년 ~ 3학년 까지 준비가 되어 있습니다. \n 과목은 국어/영어/수학/과학 으로 이루어져 있습니다. ");

        model.addAttribute("pdfUrl", pdfUrl);
        return getPath("/viewer");
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

}
