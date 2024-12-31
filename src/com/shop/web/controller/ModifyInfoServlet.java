package com.shop.web.controller;

import com.shop.domain.User;
import com.shop.service.IUserService;
import com.shop.service.impl.UserServiceImpl;
import com.shop.util.WebUtils;
import com.shop.web.formbean.ModifyInfoFormBean;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 修改user的个人信息，不包括密码
 * 
 * 原来是想将管理员修改和用户修改都统一到一个Servlet中处理
 * 
 *
 */
@WebServlet(name = "ModifyInfoServlet", urlPatterns = "/servlet/modifyInfoServlet")
public class ModifyInfoServlet extends HttpServlet {
	private IUserService service = new UserServiceImpl();

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 获取表单信息
		ModifyInfoFormBean formBean = WebUtils.requestToBean(request, ModifyInfoFormBean.class);
		System.out.println("------------ModifyInfoServlet work start-----------");
		System.out.println(formBean);

		// 原来是想分admin修改用户和user修改用户
		if (request.getSession().getAttribute("user") != null) {
			userModifyInfo(request, response, formBean);
		}

		// 回显
		request.setAttribute("modifyInfoSuccess", "修改成功！！");
		request.getRequestDispatcher("/pages/user/modify-info.jsp").forward(request, response);
	}

	private void userModifyInfo(HttpServletRequest request, HttpServletResponse response, ModifyInfoFormBean formBean)
			throws ServletException, IOException {
		// 直接从session中读取user
		User user = (User) request.getSession().getAttribute("user");
		try {
			// 从formbean中拷贝信息到user中
			BeanUtils.copyProperties(user, formBean);
			System.out.println(user);

			// 修改用户个人信息
			service.update(user);
			request.getSession().setAttribute("user", user);

		} catch (Exception e) {
			request.setAttribute("message", "对不起，修改失败！！");
			request.getRequestDispatcher("/message.jsp").forward(request, response);
			throw new RuntimeException(e);
		}
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
