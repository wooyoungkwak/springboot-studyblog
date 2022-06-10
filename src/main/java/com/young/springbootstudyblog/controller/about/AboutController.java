package com.young.springbootstudyblog.controller.about;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.young.springbootstudyblog.controller.ExtendsController;
import com.young.springbootstudyblog.model.dto.about.domain.ApplyExam;
import com.young.springbootstudyblog.model.dto.about.domain.ApplyQna;
import com.young.springbootstudyblog.model.dto.about.enums.CategoryType;
import com.young.springbootstudyblog.model.dto.about.service.ApplyExamService;
import com.young.springbootstudyblog.model.dto.about.service.ApplyQnaService;
import com.young.springbootstudyblog.model.dto.home.enums.Sort;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Date : 2022-05-24
 * Author : zilet
 * Project : studyblog
 * Description :
 */
@Slf4j
@RequiredArgsConstructor
@Controller
public class AboutController extends ExtendsController {

    private final ApplyExamService applyExamService;

    private final ApplyQnaService applyQnaService;

    private final ObjectMapper objectMapper;

    @GetMapping("/about")
    public String about(Model model,
                        @RequestParam(defaultValue = "") String content,
                        @RequestParam(defaultValue = "NONE", name = "category") String categoryName,
                        @RequestParam(defaultValue = "ASC", name = "sort") String sortName,
                        @RequestParam(defaultValue = "1") Integer pageNumber,
                        @RequestParam(defaultValue = "1") Integer pageBegin,
                        @RequestParam(defaultValue = "1") Integer pageEnd,
                        @RequestParam(defaultValue = "false") String isBeginOver,
                        @RequestParam(defaultValue = "false") String isEndOver
    ){

        CategoryType categoryType = CategoryType.valueOf(categoryName);
        Sort sort = Sort.valueOf(sortName);

        HashMap<String, Object> map = applyExamService.gets(categoryType, sort, content, pageNumber);

        List<ApplyExam> applyExams = (List<ApplyExam>) map.get("applyExams");
        int totalPage = (int) map.get("totalPage");

        Map<String, String> categories = new HashMap<>();
        for (CategoryType c : CategoryType.values() ) {
            categories.put(c.name(), c.getValue());
        }

        Map<String, String> sorts = new HashMap<>();
        for (Sort s : Sort.values()) {
            sorts.put(s.name(), s.getValue());
        }

        if (totalPage > pageEnd) {
            pageEnd = pageBegin + 3;
        } else {
            pageEnd = pageBegin + (totalPage - pageBegin);
        }

        model.addAttribute("applyExams", applyExams);

        model.addAttribute("content", content);
        model.addAttribute("category",categoryType);
        model.addAttribute("sort", Sort.valueOf(sortName));

        model.addAttribute("pageNumber", pageNumber);
        model.addAttribute("pageBegin", pageBegin);
        model.addAttribute("pageEnd", pageEnd);
        model.addAttribute("isBeginOver", isBeginOver);
        model.addAttribute("isEndOver", isEndOver);

        model.addAttribute("categories", categories);
        model.addAttribute("sorts", sorts);

        return getPath("/about");
    }


    @PostMapping("/about/applyExam")
    @ResponseBody
    public List<ApplyExam> applyExam(HttpServletRequest request, @RequestBody String body ) {
        try {
            JsonNode jsonNode = objectMapper.readTree(body);

            String categoryStr = jsonNode.get("category").asText();
            String sortStr = jsonNode.get("sort").asText();
            String content = jsonNode.get("content").asText();
            Integer pageNumber = jsonNode.get("pageNumber").asInt();

            CategoryType categoryType = CategoryType.valueOf(categoryStr);
            HashMap<String, Object> map = applyExamService.gets(categoryType, Sort.valueOf(sortStr), content, pageNumber);

            List<ApplyExam> applyExams = (List<ApplyExam>) map.get("applyExams");

            return applyExams;
        } catch (JsonProcessingException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    @PostMapping("/about/applyQna")
    @ResponseBody
    public List<ApplyQna> applyQna(HttpServletRequest request, @RequestBody String body ) {
        try {
            JsonNode jsonNode = objectMapper.readTree(body);

            String categoryStr = jsonNode.get("category").asText();
            String sortStr = jsonNode.get("sort").asText();
            String content = jsonNode.get("content").asText();
            Integer pageNumber = jsonNode.get("pageNumber").asInt();

            CategoryType categoryType = CategoryType.valueOf(categoryStr);
            HashMap<String, Object> map = applyQnaService.gets(categoryType, Sort.valueOf(sortStr), content, pageNumber);

            List<ApplyQna> applyQnas = (List<ApplyQna>) map.get("applyQnas");

            return applyQnas;
        } catch (JsonProcessingException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }



}
