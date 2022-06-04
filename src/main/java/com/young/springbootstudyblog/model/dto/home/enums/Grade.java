package com.young.springbootstudyblog.model.dto.home.enums;

import lombok.val;

/**
 * Date : 2022-05-19
 * Author : zilet
 * Project : studyblog
 * Description :
 */
public enum Grade {
    NONE("학년 선택", 999),
    SCHOOL_MIDDLE_ONE("중1", 1),
    SCHOOL_MIDDLE_TWO("중2", 2),
    SCHOOL_MIDDLE_THREE("중3", 3),
    SCHOOL_HIGH_ONE("고1", 1),
    SCHOOL_HIGH_TWO("고2", 2),
    SCHOOL_HIGH_THREE("고3", 3);

    private String value; // 중학생 / 고등학생

    private int level;    // 1학년 / 2학년 / 3학년

    Grade(String value, int level) {
        this.value = value;
        this.level = level;
    }

    public String getValue() {
        return this.value;
    }

    public int getLevel() {
        return this.level;
    }
}
