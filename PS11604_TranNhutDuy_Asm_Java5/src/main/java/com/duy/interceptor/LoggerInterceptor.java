package com.duy.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.duy.dao.CategoryDAO;
import com.duy.entity.Account;
import com.duy.entity.Category;
import com.duy.service.CartService;
import com.duy.service.SessionService;
@Component
public class LoggerInterceptor implements HandlerInterceptor {
	@Autowired
	SessionService sessionService;
	@Autowired
	CartService cart;
	@Autowired
	CategoryDAO dao;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		List<Category> listCameraPhim = dao.findByKeywords("%Máy quay phim%");
		List<Category> listCamera = dao.findByKeywords("%Máy ảnh%");
		String uri = request.getRequestURI().toString();
		request.setAttribute("listCameraPhim", listCameraPhim);
		request.setAttribute("listCamera", listCamera);
		request.setAttribute("uri", uri);
		System.out.println("preHandle()->" + request.getRequestURI());
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		Account user = sessionService.get("user");
		if(user!=null) {
			request.setAttribute("isLogin", true);
			request.setAttribute("admin", user.isAdmin());
			request.setAttribute("fullname", user.getFullname());
		}else {
			request.setAttribute("isLogin", false);
		}
		request.setAttribute("cart", cart);
		System.out.println("postHandle()->" + request.getRequestURI());
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		System.out.println("afterHCompletion()->" + request.getRequestURI());
	}
	
	
}
