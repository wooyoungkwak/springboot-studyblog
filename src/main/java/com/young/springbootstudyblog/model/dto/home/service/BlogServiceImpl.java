package com.young.springbootstudyblog.model.dto.home.service;

import com.google.common.collect.Maps;
import com.young.springbootstudyblog.model.dto.home.enums.Grade;
import com.young.springbootstudyblog.model.dto.home.enums.ServiceType;
import com.young.springbootstudyblog.model.dto.home.enums.Sort;
import com.young.springbootstudyblog.model.dto.home.enums.Subject;
import com.young.springbootstudyblog.model.dto.home.domain.Blog;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.compress.utils.Lists;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;

import javax.annotation.Nullable;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.time.LocalDate;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Date : 2022-05-19
 * Author : zilet
 * Project : studyblog
 * Description :
 */
@Slf4j
@RequiredArgsConstructor
@Service
public class BlogServiceImpl implements BlogService {

    @Value("classpath:data.txt")
    Resource resourceDataFile;

    @Override
    public Blog get(Integer blogSeq) {

        // example
        Blog blog = new Blog();
        blog.setBlogSeq(1);
        blog.setGrade(Grade.SCHOOL_MIDDLE_ONE);
        blog.setSubject(Subject.MATH);
        blog.setPdfUrl("");
        blog.setThumbnailUrl("");
        blog.setRegDt(LocalDate.now());

        return blog;
    }

    @Override
    public HashMap<String, Object> getsAll(ServiceType serviceType, Sort sort, String searchContent, Integer page) {

        if (page == null) {
            page = 1;
        }

        // example
        List<String> pdfs;
        List<String> thumbnails;

        List<Grade> grades;

        try {
            File file = resourceDataFile.getFile();
            BufferedReader bufferedReader = new BufferedReader(new FileReader(file));
            pdfs = Lists.newArrayList();
            thumbnails = Lists.newArrayList();
            grades = Lists.newArrayList();
            String pdfRootPath = "/fileUpload/assets/pdf/";
            String thumbnailRootPath = "/fileUpload/assets/thumbnail/";
            String line = "";
            while ((line = bufferedReader.readLine()) != null) {
                String[] temp = line.split("\\|");
                pdfs.add(pdfRootPath + temp[0]);
                thumbnails.add(thumbnailRootPath + temp[1]);

                if (temp[0].indexOf("One") != -1) {
                    grades.add(Grade.SCHOOL_MIDDLE_ONE);
                } else if (temp[0].indexOf("Two") != -1) {
                    grades.add(Grade.SCHOOL_MIDDLE_TWO);
                } else {
                    grades.add(Grade.SCHOOL_MIDDLE_THREE);
                }
            }

        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        List<Blog> blogs = Lists.newArrayList();

        int totalNumber = thumbnails.size();
        int listNumber = 9;
        int totalPage = (totalNumber / listNumber);

        int rest = totalNumber % listNumber;
        if (rest > 0) {
            totalPage += 1;
        }

        int offset = (page - 1) * listNumber;
        int buffer = totalNumber - offset;

        if (buffer > listNumber) {
            buffer = listNumber + offset;
        } else {
            buffer = totalNumber;
        }

        for (int i = offset; i < buffer; i++) {
            Blog blog = new Blog();
            blog.setBlogSeq(i);
            blog.setGrade(grades.get(i));
            blog.setSubject(Subject.MATH);
            blog.setSummary("이 문제집은 테스트 문제집으로 확인을 위한 테스트 문제집 입니다. 오해 없으시길 바랍니다.");
            blog.setPdfUrl(pdfs.get(i));
            blog.setThumbnailUrl(thumbnails.get(i));
            blog.setRegDt(LocalDate.now());
            blogs.add(blog);
        }

        blogs = getBlogByFilter(blogs, serviceType, searchContent);

        blogs = getBlogBySort(blogs, serviceType, sort);

        HashMap<String, Object> resultMap = Maps.newHashMap();
        resultMap.put("blogs", blogs);
        resultMap.put("totalPage", totalPage);
        return resultMap;
    }

    private List<Blog> getBlogByFilter(List<Blog> blogs, ServiceType serviceType, String searchContent) {
        List<Blog> filterBlogs = null;
        switch (serviceType) {
            case TYPE_SUBJECT:
                filterBlogs = blogs.stream()
                        .filter(blog -> blog.getSubject().getValue().indexOf(searchContent) > -1)
                        .collect(Collectors.toList());
                break;
            case TYPE_GRADE:
                filterBlogs = blogs.stream()
                        .filter(blog -> blog.getGrade().getValue().indexOf(searchContent) > -1)
                        .collect(Collectors.toList());
                break;
            case NONE:
            default:
                filterBlogs = blogs.stream()
                        .filter(blog -> blog.getSummary().indexOf(searchContent) > -1)
                        .collect(Collectors.toList());
                break;
        }
        return filterBlogs;
    }

    private List<Blog> getBlogBySort(List<Blog> blogs, @Nullable ServiceType serviceType, Sort sort) {
        List<Blog> sortBlogs = null;
        Comparator<Blog> comparator = null;

        switch (serviceType) {
            case TYPE_SUBJECT:
                comparator = Comparator.comparing(Blog::getSubject);
                break;
            case TYPE_GRADE:
                comparator = Comparator.comparing(Blog::getGrade);
                break;
            case NONE:
                comparator = Comparator.comparing(Blog::getBlogSeq);
            default:
        }

        if (Sort.DESC == sort) {
            comparator = comparator.reversed();
        }

        sortBlogs = blogs.stream().sorted(comparator).collect(Collectors.toList());
        return sortBlogs;
    }

    @Override
    public HashMap<String, Object> getsAllByGrade(Grade grade, Integer page) {
        return null;
    }

    @Override
    public HashMap<String, Object> getsAllBySubject(Subject subject, Integer page) {
        return null;
    }

    @Override
    public void set(Blog blog) throws Exception {

    }

}
