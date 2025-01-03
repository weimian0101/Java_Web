package com.shop.web.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.domain.Page;
import com.shop.domain.User;
import com.shop.service.IUserService;
import com.shop.service.impl.UserServiceImpl;
import com.shop.util.PageUtils;
import com.shop.util.WebUtils;

/**
 * 用于获得用户的分页，每次切换页面都要访问
 * 
 *
 */
@WebServlet(name = "GetUsersPageServlet", urlPatterns = "/servlet/getUsersPageServlet")
public class GetUsersPageServlet extends HttpServlet {
	private IUserService userService = new UserServiceImpl();

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("------------GetUsersPageServlet work start-----------");
		try {
			// 从request中直接读取信息，来获取page
			Page<User> page = PageUtils.getPage(request, response, 5, userService);
			System.out.println("Get UsersPage:" + page);
			//回显
			request.setAttribute("usersPage", page);
			request.getRequestDispatcher("/pages/admin/manage-users.jsp").forward(request, response);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		System.out.println("------------GetUsersPageServlet work finished-----------");
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
