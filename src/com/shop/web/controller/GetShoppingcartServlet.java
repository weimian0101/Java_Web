package com.shop.web.controller;

import com.shop.domain.ShoppingcartItemVO;
import com.shop.domain.User;
import com.shop.service.IShoppingcartItemVOService;
import com.shop.service.impl.ShoppingcartItemVOServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

/**
 * 获得购物车页面信息
 * 
 *
 */
@WebServlet(name = "GetShoppingcartServlet", urlPatterns = "/servlet/getShoppingcartServlet")
public class GetShoppingcartServlet extends HttpServlet {
	private IShoppingcartItemVOService service = new ShoppingcartItemVOServiceImpl();

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("------------GetShoppingcartServlet work start-----------");

		// 从session中读取user
		User user = (User) request.getSession().getAttribute("user");
		int userId = user.getUserId();

		// 获取该用户的购物车信息
		List<ShoppingcartItemVO> items = null;
		try {
			items = service.get(userId);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		System.out.println("items:" + items);

		// 购物车总价
		double total = 0;
		for (ShoppingcartItemVO item : items) {
			total += item.getPrice() * item.getNumber();
		}
		
		// 回显
		request.setAttribute("total", total);
		request.setAttribute("items", items);
		request.getRequestDispatcher("/pages/user/shoppingcart.jsp").forward(request, response);

		System.out.println("------------GetShoppingcartServlet work finished-----------");
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
