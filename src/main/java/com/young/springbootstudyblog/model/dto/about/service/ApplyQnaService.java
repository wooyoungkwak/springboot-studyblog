package com.young.springbootstudyblog.model.dto.about.service;

import com.young.springbootstudyblog.model.dto.about.enums.CategoryType;
import com.young.springbootstudyblog.model.dto.home.enums.Sort;

import java.util.HashMap;

/**
 * Date : 2022-06-08
 * Author : zilet
 * Project : springboot-studyblog
 * Description :
 */
public interface ApplyQnaService {

    public HashMap<String, Object> gets(CategoryType categoryType, Sort sort, String content, int pageNumber);

}
