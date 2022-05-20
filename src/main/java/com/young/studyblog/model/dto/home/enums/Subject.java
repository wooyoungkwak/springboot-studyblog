package com.young.studyblog.model.dto.home.enums;

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

    private String name;

    Subject(String name){
        this.name = name;
    }

    public String getName(){
        return this.name;
    }

}
