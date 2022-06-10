package com.young.springbootstudyblog.controller.contact;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.common.collect.Maps;
import com.young.springbootstudyblog.controller.ExtendsController;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;

/**
 * Date : 2022-05-24
 * Author : zilet
 * Project : studyblog
 * Description :
 */
@Slf4j
@RequiredArgsConstructor
@Controller
public class ContactController extends ExtendsController {

    private final ObjectMapper objectMapper;

    @GetMapping("/contact")
    public String contact(Model model){
        model.addAttribute("name", "LMS 시스템 관련 문의 ");
        model.addAttribute("introduce", "LMS 시스템에 관련된 궁금증이 있다면 메일로 저희에게 알려주세요. ");
        return getPath("/contact");
    }

    @PostMapping("/contact/form")
    @ResponseBody
    public Object form(@RequestBody String body) {
        HashMap<String, String> map = Maps.newHashMap();
        try {
            JsonNode jsonNode = objectMapper.readTree(body);

            log.info(" userScale = {}", jsonNode.get("userScale").asText());
            log.info(" purpose = {}", jsonNode.get("purpose").asText());
            log.info(" email = {}", jsonNode.get("email").asText());
            log.info(" name = {}", jsonNode.get("name").asText());
            log.info(" phone = {}", jsonNode.get("phone").asText());
            log.info(" message = {}", jsonNode.get("message").asText());

            map.put("result", "success");
            return map;
        } catch (JsonProcessingException e) {
            e.printStackTrace();

            map.put("result", "fail");
            return map;
        }
    }
}
