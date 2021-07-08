package com.duy.service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CookieService {
	@Autowired
	HttpServletRequest req;
	@Autowired
	HttpServletResponse resp;
	/**
	 * Đọc cookie từ request
	 * @param name tên cookie cần đọc
	 * @return đối tượng cookie đọc được hoặc null nếu không tồn tại
	 */
	public String get(String name) {
		Cookie[] cookies = req.getCookies();
		if(cookies != null) {
			for(Cookie cookie: cookies) {
				if(cookie.getName().equalsIgnoreCase(name)) {
					return cookie.getValue();
				}
			}
		}
		return null;
	}
	/**
	 * Tạo và gửi cookie về client
	 * @param name tên cookie
	 * @param value giá trị cookie
	 * @param hours thời hạn (giờ)
	 * @return đối tượng cookie đã tạo
	 */
	public Cookie add(String name, String value, int hours) {
		Cookie cookie = new Cookie(name, value);
		cookie.setMaxAge(hours*60*60);
		cookie.setPath("/");
		resp.addCookie(cookie);
		return cookie;
	}
	/**
	 * Xóa cookie khỏi client
	 * @param name tên cookie cần xóa
	 */
	public void remove(String name) {
		add(name, "", 0);
	}

}
