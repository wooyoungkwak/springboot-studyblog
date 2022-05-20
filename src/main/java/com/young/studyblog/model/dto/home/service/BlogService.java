package com.young.studyblog.model.dto.home.service;

import com.young.studyblog.model.dto.home.domain.Blog;
import com.young.studyblog.model.dto.home.enums.Grade;
import com.young.studyblog.model.dto.home.enums.Subject;

import java.util.HashMap;
import java.util.List;

/**
 * Date : 2022-05-19
 * Author : zilet
 * Project : studyblog
 * Description :
 */
public interface BlogService {

    public Blog get(Integer blogSeq);

    public HashMap<String, Object> getsAll(Integer page);

    public HashMap<String, Object> getsAllByGrade(Grade grade, Integer page);

    public HashMap<String, Object> getsAllBySubject(Subject subject, Integer page);

    public void set(Blog blog) throws Exception;

}
