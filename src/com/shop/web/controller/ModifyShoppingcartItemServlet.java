package com.shop.web.controller;

import com.shop.domain.ShoppingcartItem;
import com.shop.service.IShoppingcartItemService;
import com.shop.service.impl.ShoppingcartItemServiceImpl;
import com.shop.util.WebUtils;
import com.shop.web.formbean.ShoppingcartItemFormBean;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 修改商品数量
 * 
 *
 *
 */
@WebServlet(name = "ModifyShoppingcartItemServlet", urlPatterns = "/servlet/modifyShoppingcartItemServlet")
public class ModifyShoppingcartItemServlet extends HttpServlet {
	private IShoppingcartItemService service = new ShoppingcartItemServiceImpl();

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("------------ModifyShoppingcartItemServlet work start-----------");
		// 读取表单数据
		ShoppingcartItemFormBean formBean = WebUtils.requestToBean(request, ShoppingcartItemFormBean.class);
		System.out.println(formBean);

		// 更新购物车商品数据
		ShoppingcartItem item = new ShoppingcartItem();
		try {
			BeanUtils.copyProperties(item, formBean);
			System.out.println(item);

			service.update(item);
		} catch (Exception e) {
			request.setAttribute("operateError", "修改失败！！");
			throw new RuntimeException(e);
		}
		
		// 回显
		request.setAttribute("operateSuccess", "修改成功！！");
		request.getRequestDispatcher("/servlet/getShoppingcartServlet").forward(request, response);

		System.out.println("------------ModifyShoppingcartItemServlet work finished-----------");
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
