package com.duy.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.duy.interceptor.AuthInterceptor;
import com.duy.interceptor.LoggerInterceptor;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer {
	@Autowired
	LoggerInterceptor loggerInterceptor;
	@Autowired
	AuthInterceptor authInterceptor;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(loggerInterceptor)
			.addPathPatterns("/*", "/**");
		
		registry.addInterceptor(authInterceptor)
			.addPathPatterns("/order/*", "/account/*", "/account/**", "/account/***")
			.addPathPatterns("/admin/*","/admin/**","/admin/***")
			.excludePathPatterns("/*", "/admin/login", "/admin/forgot-password");
	}
	
	
}
