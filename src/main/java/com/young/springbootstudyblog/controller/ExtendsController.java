/*
  Author: zilet
  Date: 2022-02-17
  Description: Controller 의 Root 경로 가져오기
*/
package com.young.springbootstudyblog.controller;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ExtendsController {

    protected String getPath(String path) {
        String rootPath = this.getClass().getSimpleName().split("Controller")[0].toLowerCase();
        return "/controller/" + rootPath + path;
    }

    protected String getPath(Class c, String path) {
        String rootPath = c.getSimpleName().split("Controller")[0].toLowerCase();
        return "/controller/" + rootPath + path;
    }

}
