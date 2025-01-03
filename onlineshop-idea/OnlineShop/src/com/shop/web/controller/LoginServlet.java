package com.shop.web.controller;

import java.io.*;
import java.sql.SQLException;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.shop.domain.Admin;
import com.shop.domain.User;
import com.shop.service.IAdminService;
import com.shop.service.IUserService;
import com.shop.service.impl.AdminServiceImpl;
import com.shop.service.impl.UserServiceImpl;
import com.shop.util.WebUtils;
import com.shop.web.formbean.LoginFormBean;
import com.shop.web.formbean.RegisterFormBean;

/**
 * 登录操作，保存session信息
 * 
 *
 */
@WebServlet(name = "LoginServlet", urlPatterns = "/servlet/loginServlet")
public class LoginServlet extends HttpServlet {
	private IAdminService adminService = new AdminServiceImpl();
	private IUserService userService = new UserServiceImpl();

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 将客户端提交的表单数据封装到LoginFormBean对象中
		LoginFormBean formBean = WebUtils.requestToBean(request, LoginFormBean.class);
		System.out.println("------------LoginServlet work start-----------");
		System.out.println(formBean);

		// 先登出，再登录
		userLogout(request, response);
		adminLogout(request, response);

		// 登录操作
		boolean isLogin = false;
		if (formBean.getStatus().equals("user")) {
			isLogin = userLogin(request, response, formBean);
		} else if (formBean.getStatus().equals("admin")) {
			isLogin = adminLogin(request, response, formBean);
		}

		// 判断是否正确登录
		if (isLogin == true) {
			sendAutoLoginCookie(request, response, formBean);// 发送自动登陆cookie给客户端浏览器进行存储
			response.sendRedirect(request.getContextPath() + "/index.jsp");
		} else {
			request.setAttribute("loginError", "用户名或密码不对！！");
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}

		System.out.println("-----------LoginServlet work finished-----------");
	}

	/**
	 * @Method: sendAutoLoginCookie
	 * @Description: 发送自动登录cookie给客户端浏览器
	 *
	 * @param request
	 * @param response
	 * @param formBean
	 */
	private void sendAutoLoginCookie(HttpServletRequest request, HttpServletResponse response, LoginFormBean formBean) {
		if (formBean.getLogintime() != 0) {
			int logintime = formBean.getLogintime();
			// 创建cookie,名字是autologin，值是用户登录的用户名和密码，用户名和密码之间使用.进行分割，密码明文，方便查错且非正规网站，就不做加密处理了
			Cookie cookie = new Cookie("autologin",
					formBean.getAccount() + "." + formBean.getPassword() + "." + formBean.getStatus());
			// 设置cookie的有效期
			cookie.setMaxAge(logintime);
			// 设置cookie的有效路径
			cookie.setPath(request.getContextPath());
			// 将cookie写入到客户端浏览器
			response.addCookie(cookie);
		}
	}

	/**
	 * @Method: userLogin
	 * @Description: 用户登录
	 * 
	 * @param request
	 * @param response
	 * @param formBean
	 * @throws IOException
	 * @throws ServletException
	 */
	private boolean userLogin(HttpServletRequest request, HttpServletResponse response, LoginFormBean formBean)
			throws ServletException, IOException {
		User user = null;
		try {
			user = userService.login(formBean.getAccount(), formBean.getPassword());
			System.out.println(user);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

		if (user == null) {
			return false;
		} else {
			// 成功登录
			request.getSession().setAttribute("user", user);
			System.out.println("--------User login succeed-----------");
			return true;
		}
	}

	/**
	 * 如果有登录的话就先登出
	 * 
	 * @param request
	 * @param response
	 */
	private void userLogout(HttpServletRequest request, HttpServletResponse response) {
		if (request.getSession().getAttribute("user") != null) {
			request.getSession().removeAttribute("user");
		}
	}

	/**
	 * @Method: adminLogin
	 * @Description: 管理员登录
	 * 
	 * @param request
	 * @param response
	 * @param formBean
	 * @throws IOException
	 * @throws ServletException
	 */
	private boolean adminLogin(HttpServletRequest request, HttpServletResponse response, LoginFormBean formBean)
			throws ServletException, IOException {
		Admin admin = null;
		try {
			admin = adminService.login(formBean.getAccount(), formBean.getPassword());
			System.out.println(admin);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

		if (admin == null) {
			return false;
		} else {
			// 成功登录
			request.getSession().setAttribute("admin", admin);
			System.out.println("--------Admin login succeed-----------");
			return true;
		}
	}

	/**
	 * 如果有登录的话就先登出
	 * 
	 * @param request
	 * @param response
	 */
	private void adminLogout(HttpServletRequest request, HttpServletResponse response) {
		if (request.getSession().getAttribute("admin") != null) {
			request.getSession().removeAttribute("admin");
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}