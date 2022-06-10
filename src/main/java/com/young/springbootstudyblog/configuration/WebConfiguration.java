package com.young.springbootstudyblog.configuration;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * Date : 2022-05-20
 * Author : zilet
 * Project : studyblog
 * Description :
 */
@Slf4j
@Configuration
public class WebConfiguration implements WebMvcConfigurer {

    @Value("${file.resourceUri}")
    private String resourceUri;
    @Value("${file.resourceLocation}")
    private String resourceLocation;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        log.info("resource pass registered :: {} {} ", resourceUri, resourceLocation);
        registry.addResourceHandler(resourceUri).addResourceLocations("file:///" + resourceLocation);
    }
}
