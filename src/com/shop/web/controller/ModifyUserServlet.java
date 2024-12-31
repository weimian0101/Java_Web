package com.shop.web.controller;

import com.shop.domain.User;
import com.shop.service.IUserService;
import com.shop.service.impl.UserServiceImpl;
import com.shop.util.WebUtils;
import com.shop.web.formbean.ModifyUserFormBean;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 管理员修改用户个人信息&密码。原则上管理员根本都不应该修改用户信息
 * 
 *
 */
@WebServlet(name = "ModifyUserServlet", urlPatterns = "/servlet/modifyUserServlet")
public class ModifyUserServlet extends HttpServlet {

	private IUserService userService = new UserServiceImpl();
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("------------ModifyUserServlet work start-----------");
		//读取表单数据
		ModifyUserFormBean formBean = WebUtils.requestToBean(request, ModifyUserFormBean.class);
		System.out.println(formBean);

		//修改
		modify(request, response, formBean);

		//回显
		request.setAttribute("operateSuccess", "修改成功！！");
		request.getRequestDispatcher("/pages/admin/manage-users.jsp").forward(request, response);
	}

	private void modify(HttpServletRequest request, HttpServletResponse response, ModifyUserFormBean formBean)
			throws ServletException, IOException {
		User user = new User();
		try {
			BeanUtils.copyProperties(user, formBean);
			System.out.println(user);

			userService.update(user);
		} catch (Exception e) {
			request.setAttribute("operateError", "操作失败！！");
			request.getRequestDispatcher("/pages/admin/manage-users.jsp").forward(request, response);
			throw new RuntimeException(e);
		}

	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
