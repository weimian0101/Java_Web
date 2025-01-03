package com.shop.web.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @ClassName: NoCacheFilter
 * @Description: 禁止浏览器缓存所有动态页面
 *
 */
/*
 * @WebFilter(filterName = "NoCacheFilter", urlPatterns = "*.jsp",
 * 
 * dispatcherTypes = { DispatcherType.REQUEST, DispatcherType.FORWARD })
 */
public class NoCacheFilter implements Filter {

	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {

		//System.out.println("NoCacheFilter.doFilter()---started---;");
		// 把ServletRequest/Response强转成HttpServletRequest/Response
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;

		// 禁止浏览器缓存所有动态页面
		response.setDateHeader("Expires", -1);
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Pragma", "no-cache");

		chain.doFilter(request, response);
		//System.out.println("NoCacheFilter.doFilter()---finished---;");
	}

	public void init(FilterConfig filterConfig) throws ServletException {

	}

	public void destroy() {

	}
}