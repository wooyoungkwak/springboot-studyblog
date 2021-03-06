package com.young.springbootstudyblog.model.dto.home.enums;

/**
 * Date : 2022-05-19
 * Author : zilet
 * Project : studyblog
 * Description :
 */
public enum Subject {

    NONE("과목 선택"),
    MATH("수학"),

    KOREAN("국어"),

    ENGLISH("영어"),

    SCIENCE("과학");

    private String value;

    Subject(String value){
        this.value = value;
    }

    public String getValue(){
        return this.value;
    }

}
