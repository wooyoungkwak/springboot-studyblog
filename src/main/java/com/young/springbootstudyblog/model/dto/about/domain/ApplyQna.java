package com.young.springbootstudyblog.model.dto.about.domain;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

/**
 * Date : 2022-06-08
 * Author : zilet
 * Project : springboot-studyblog
 * Description :
 */
@Getter
@Setter
public class ApplyQna {
    int applyQnaSeq;
    String subject;
    String content;
    int hit;
    LocalDateTime regDT;

    public ApplyQna(int applyExamSeq, String subject, String content, int hit, LocalDateTime regDT) {
        this.applyQnaSeq= applyExamSeq;
        this.subject= subject;
        this.content= content;
        this.hit= hit;
        this.regDT= regDT;
    }

}
