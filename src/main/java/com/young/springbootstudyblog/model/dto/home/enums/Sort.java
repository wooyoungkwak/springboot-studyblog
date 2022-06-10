package com.young.springbootstudyblog.model.dto.home.enums;

import lombok.Getter;

/**
 * Date : 2022-06-06
 * Author : zilet
 * Project : springboot-studyblog
 * Description :
 */
public enum Sort {
    ASC("오름차순"),

    DESC("내림차순");

    private String value;

    Sort(String value){
        this.value = value;
    }

    public String getValue(){
        return this.value;
    }
}
