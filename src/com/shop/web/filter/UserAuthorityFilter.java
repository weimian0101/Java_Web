package com.shop.web.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 用户未登录（未携带session）的情况，拒绝进入某些页面(需要用户登录才能操作的页面)
 * 
 *
 */
public class UserAuthorityFilter implements Filter{
	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;
		
		//用户已经登录，放行
		if(request.getSession().getAttribute("user")!=null) {
			chain.doFilter(request, response);
			return;
		}
		
		response.sendRedirect(request.getContextPath()+"/index.jsp");
		
	}
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {

	}

	@Override
	public void destroy() {

	}
}
