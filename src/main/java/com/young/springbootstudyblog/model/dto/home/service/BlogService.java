package com.young.springbootstudyblog.model.dto.home.service;

import com.young.springbootstudyblog.model.dto.home.domain.Blog;
import com.young.springbootstudyblog.model.dto.home.enums.Grade;
import com.young.springbootstudyblog.model.dto.home.enums.ServiceType;
import com.young.springbootstudyblog.model.dto.home.enums.Sort;
import com.young.springbootstudyblog.model.dto.home.enums.Subject;

import java.util.HashMap;

/**
 * Date : 2022-05-19
 * Author : zilet
 * Project : studyblog
 * Description :
 */
public interface BlogService {

    public Blog get(Integer blogSeq);

    public HashMap<String, Object> getsAll(ServiceType serviceType, Sort sort, String searchContent, Integer page);

    public HashMap<String, Object> getsAllByGrade(Grade grade, Integer page);

    public HashMap<String, Object> getsAllBySubject(Subject subject, Integer page);

    public void set(Blog blog) throws Exception;

}
