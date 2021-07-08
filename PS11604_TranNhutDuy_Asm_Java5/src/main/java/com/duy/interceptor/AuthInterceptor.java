package com.duy.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.duy.entity.Account;
import com.duy.service.SessionService;


@Component
public class AuthInterceptor implements HandlerInterceptor {
	@Autowired
	SessionService sessionService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String uri = request.getRequestURI();
		if(request.getSession().getAttribute("user")==null) {
			request.getSession().setAttribute("secureUri", request.getRequestURI());
			if(uri.startsWith("/admin/")) {
				response.sendRedirect("/admin/login");
				return false;
			}
			response.sendRedirect("/login");
			return false;
		}else {
			Account user = sessionService.get("user");
			if(!user.isAdmin() && uri.startsWith("/admin/")) {
				response.sendRedirect("/home");
				return false;
			}
		}
		return true;
	}
	
}
