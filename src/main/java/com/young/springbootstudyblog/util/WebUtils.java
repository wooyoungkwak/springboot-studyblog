package com.young.springbootstudyblog.util;

import com.google.common.collect.Maps;

import javax.servlet.http.HttpServletRequest;
import java.util.Enumeration;
import java.util.HashMap;

/**
 * Date : 2022-05-24
 * Author : zilet
 * Project : studyblog
 * Description :
 */
public class WebUtils {

    public static HashMap<String, String> getParameterMap(HttpServletRequest request) {
        HashMap<String, String> resultMap = Maps.newHashMap();
        Enumeration<String> names = request.getParameterNames();
        while (names.hasMoreElements()) {
            String name = names.nextElement();
            resultMap.put(name, request.getParameter(name));
        }
        return resultMap;

    }
}
