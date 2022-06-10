package com.young.springbootstudyblog.model.dto.home.enums;

/**
 * Date : 2022-06-06
 * Author : zilet
 * Project : springboot-studyblog
 * Description :
 */
public enum ServiceType {

    NONE("선택"),

    TYPE_SUBJECT("과목"),

    TYPE_GRADE("학년");

    private String value;

    ServiceType(String value) {
        this.value = value;
    }

    public String getValue() {
        return this.value;
    }
}
