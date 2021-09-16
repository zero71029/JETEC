package com.jetec.shop.interceptor;

import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

public class Interceptor implements WebMvcConfigurer{
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/images/product/**").addResourceLocations("file:E:\\shop\\src\\main\\resources\\static\\images\\product\\");
        registry.addResourceHandler("/images/mainpic/**").addResourceLocations("file:e:\\shop\\src\\main\\resources\\static\\images\\mainpic\\");
        registry.addResourceHandler("/images/stepPic/**").addResourceLocations("file:e:\\shop\\src\\main\\resources\\static\\images\\stepPic\\");
        registry.addResourceHandler("/images/shop/**").addResourceLocations("file:e:\\shop\\src\\main\\resources\\static\\images\\shop\\");
    }
}
