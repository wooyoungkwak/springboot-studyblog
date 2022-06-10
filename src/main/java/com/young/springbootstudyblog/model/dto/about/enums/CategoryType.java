package com.young.springbootstudyblog.model.dto.about.enums;

/**
 * Date : 2022-06-07
 * Author : zilet
 * Project : springboot-studyblog
 * Description :
 */
public enum CategoryType {

    NONE("선택"),

    SUBJECT("제목"),

    REGDT("등록일");

    private String value;

    CategoryType (String value) {
        this.value = value;
    }

    public String getValue() {
        return this.value;
    }
}
