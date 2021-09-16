package com.jetec.shop.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.jetec.shop.model.UserBean;

public class UserFilter implements Filter {

	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain)
			throws IOException, ServletException {
		servletRequest.setCharacterEncoding("utf-8");
		servletResponse.setCharacterEncoding("utf-8");
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		HttpServletResponse response = (HttpServletResponse) servletResponse;
		UserBean user = (UserBean) request.getSession().getAttribute("user");
		Object object = request.getSession().getAttribute("cart");
		if (user == null) {
			response.sendRedirect(request.getContextPath() + "/login.jsp");
		} else {
//			if (object == null) {
//				response.sendRedirect(request.getContextPath() + "/shop.jsp");
//			} else {
				chain.doFilter(servletRequest, servletResponse);
//			}
		}
	}
}
