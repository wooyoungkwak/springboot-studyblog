package com.young.springbootstudyblog.model.dto.home.domain;

import com.young.springbootstudyblog.model.dto.home.enums.Grade;
import com.young.springbootstudyblog.model.dto.home.enums.Subject;
import lombok.Data;

import java.time.LocalDate;

/**
 * Date : 2022-05-19
 * Author : zilet
 * Project : studyblog
 * Description :
 */
@Data
public class Blog {
    private Integer blogSeq;    //
    private Grade grade;       // 학년
    private Subject subject;     // 과목
    private String summary;     // 요약 설명
    private String pdfUrl;        // pdf File
    private String thumbnailUrl;   // thumbnail file
    private LocalDate regDt;        // 등록 일자
}
